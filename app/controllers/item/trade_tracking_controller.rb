class Item::TradeTrackingController < ApplicationController
  before_action :authenticate_user!

  def index
    @usdt_zec = Poloniex::Market.by_pair("USDT_ZEC").last
    @usdt_eth = Poloniex::Market.by_pair("USDT_ETH").last
    @usdt_etc = Poloniex::Market.by_pair("USDT_ETC").last
    @usdt_sc = Poloniex::Market.by_pair("BTC_SC").last.to_f * Poloniex::Market.by_pair("USDT_BTC").last.to_f
  end
end
