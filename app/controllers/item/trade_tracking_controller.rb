class Item::TradeTrackingController < ApplicationController
  before_action :authenticate_user!
  caches_action :index, expires_in: 20.seconds

  def index

    @currency = params[:currency] ||= "TWD"

    convert_form_usd = Money.default_bank.get_rate('USD', @currency).to_f

    @usdt_zec = Poloniex::Market.by_pair("USDT_ZEC").last.to_f * convert_form_usd
    @usdt_eth = Poloniex::Market.by_pair("USDT_ETH").last.to_f * convert_form_usd
    @usdt_dgb = Poloniex::Market.by_pair("BTC_DGB").last.to_f * Poloniex::Market.by_pair("USDT_BTC").last.to_f * convert_form_usd
    @usdt_sc = Poloniex::Market.by_pair("BTC_SC").last.to_f * Poloniex::Market.by_pair("USDT_BTC").last.to_f * convert_form_usd
    @usdt_btc = Poloniex::Market.by_pair("USDT_BTC").last.to_f * convert_form_usd

    response_yunbi = RestClient.get "https://yunbi.com/api/v2/tickers"
    data_yunbi = JSON.parse(response_yunbi.body)

    if @currency != "CNY"
      convert_form_cny = Money.default_bank.get_rate('CNY', @currency).to_f
    else
      convert_form_cny = 1
    end

    @btc_yunbi = data_yunbi["btccny"]["ticker"]["sell"].to_f * convert_form_cny
    @zec_yunbi = data_yunbi["zeccny"]["ticker"]["sell"].to_f * convert_form_cny
    @eth_yunbi = data_yunbi["ethcny"]["ticker"]["sell"].to_f * convert_form_cny
    @sc_yunbi = data_yunbi["sccny"]["ticker"]["sell"].to_f * convert_form_cny
    @btc_yunbi = data_yunbi["btccny"]["ticker"]["sell"].to_f * convert_form_cny

    response_bitoex = RestClient.get "https://www.bitoex.com/api/v1/get_rate"
    data_bitoex = JSON.parse(response_bitoex.body)

    if @currency != "TWD"
      convert_form_twd = Money.default_bank.get_rate('TWD', @currency).to_f
    else
      convert_form_twd = 1
    end

    @btc_bitoex = data_bitoex["buy"] * convert_form_twd

    response_maicoin = RestClient.get "https://api.maicoin.com/v1/prices/twd"
    data_maicoin = JSON.parse(response_maicoin.body)

    @btc_maicoin = data_maicoin["buy_price"].to_f * convert_form_twd

    response_okcoin = RestClient.get "https://www.okcoin.cn/api/v1/ticker.do?symbol=btc_usd"
    data_okcoin = JSON.parse(response_okcoin.body)

    @btc_okcoin = data_okcoin["ticker"]["buy"].to_f * convert_form_cny

    set_page_title "虛擬幣追蹤行情"
  end
end
