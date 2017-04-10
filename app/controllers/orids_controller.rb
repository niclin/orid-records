class OridsController < ApplicationController
  before_action :authenticate_user!

  def index
    @orids = current_user.orids
  end

  def new
    @orid = Orid.new
  end

  def create
    @orid = Orid.new(orid_params)
    @orid.user = current_user

    @orid.save

    redirect_to orids_path
  end

  def update
  end

  def edit
  end

  def show
  end

  def destroy
  end

  private

  def orid_params
    params.require(:orid).permit(:objective, :reflective, :interpretive, :decisional)
  end
end
