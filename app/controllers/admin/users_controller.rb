class Admin::UsersController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @users = User.all
  end

  def promote
    @user = User.find(params[:id])
    @user.promote

    redirect_to :back
  end

  def deomote
    @user = User.find(params[:id])
    @user.deomote

    redirect_to :back
  end
end
