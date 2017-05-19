class Account::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      flash[:notice] = "信息更新成功"
      redirect_to account_users_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar)
  end
end
