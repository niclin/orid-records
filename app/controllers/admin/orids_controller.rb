class Admin::OridsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @orids = Orid.all
  end
end
