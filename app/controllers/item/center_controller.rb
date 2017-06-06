class Item::CenterController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = Item.all
  end

  def buy
  end
end
