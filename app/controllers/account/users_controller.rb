class Account::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @orids = current_user.orids
  end

end
