class Item::TradeTrackingController < ApplicationController
  before_action :authenticate_user!

  def index

    @currency = params[:currency] ||= "TWD"

    @convert_form_usd = Money.default_bank.get_rate('USD', @currency).to_f

    @usdt_zec = Poloniex::Market.by_pair("USDT_ZEC").last.to_f * @convert_form_usd
    @usdt_eth = Poloniex::Market.by_pair("USDT_ETH").last.to_f * @convert_form_usd
    @usdt_dgb = Poloniex::Market.by_pair("BTC_DGB").last.to_f * Poloniex::Market.by_pair("USDT_BTC").last.to_f * @convert_form_usd
    @usdt_sc = Poloniex::Market.by_pair("BTC_SC").last.to_f * Poloniex::Market.by_pair("USDT_BTC").last.to_f * @convert_form_usd
    @usdt_btc = Poloniex::Market.by_pair("USDT_BTC").last.to_f * @convert_form_usd

    client_yunbi = PeatioAPI::Client.new endpoint: 'https://yunbi.com'
    response_yunbi = client_yunbi.get_public '/api/v2/tickers'

    if @currency != "CNY"
      @convert_form_cny = Money.default_bank.get_rate('CNY', @currency).to_f
    else
      @convert_form_cny = 1
    end

    @btc_yunbi = response_yunbi["btccny"]["ticker"]["sell"].to_f * @convert_form_cny
    @zec_yunbi = response_yunbi["zeccny"]["ticker"]["sell"].to_f * @convert_form_cny
    @eth_yunbi = response_yunbi["ethcny"]["ticker"]["sell"].to_f * @convert_form_cny
    @sc_yunbi = response_yunbi["sccny"]["ticker"]["sell"].to_f * @convert_form_cny
    @btc_yunbi = response_yunbi["btccny"]["ticker"]["sell"].to_f * @convert_form_cny

    client_bitoex = PeatioAPI::Client.new endpoint: 'https://www.bitoex.com/'
    response_bitoex = client_bitoex.get_public '/api/v1/get_rate'

    if @currency != "TWD"
      @convert_form_twd = Money.default_bank.get_rate('TWD', @currency).to_f
    else
      @convert_form_twd = 1
    end

    @btc_bitoex = response_bitoex["buy"] * @convert_form_twd

    client_maicoin = PeatioAPI::Client.new endpoint: 'https://api.maicoin.com'
    response_maicoin = client_maicoin.get_public '/v1/prices/twd'

    @btc_maicoin = response_maicoin["buy_price"].to_f * @convert_form_twd

    set_page_title "虛擬幣追蹤行情"
  end
end
