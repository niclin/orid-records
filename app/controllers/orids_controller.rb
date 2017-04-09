class OridsController < ApplicationController
  before_action :authenticate_user!

  def index
    @orids = Orid.all
  end

  def new
    @orid = Orid.new
  end

  def create
  end

  def update
  end

  def edit
  end

  def show
  end

  def destroy
  end
end
