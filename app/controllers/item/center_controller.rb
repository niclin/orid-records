class Item::CenterController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = Item.all
  end

  def buy
    @item = Item.find(params[:id])

    if @item.buy(current_user)
      redirect_to :back
      flash[:notice] = "成功購買"
    else
      redirect_to :back
      flash[:warning] = "購買失敗, 點數不足，或是商品不存在"
    end
  end
end
