class OrdersController < ApplicationController
  before_action :authenticate_user!

  def checkout
    @order = current_user.orders.build
  end

  def create
    @order = current_user.orders.build

    if @order.save
      @order.build_item
      @order.calculate_total!
      redirect_to order_path(@order.token)
    else
      redirect_to "/"
    end
  end

  def show
    @order = Order.find_by_token(params[:id])
    @order_items = @order.items
  end

  def pay
    @order = Order.find_by_token(params[:id])
    @order.pay!

    redirect_to order_path(@order.token), notice: "成功完成付款"
  end
end
