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
      flash[:notice] = "購買失敗"
    end
  end
end
