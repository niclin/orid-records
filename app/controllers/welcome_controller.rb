class WelcomeController < ApplicationController

  def index
    @today_orids = Orid.where("created_at >= ?", Time.zone.now.beginning_of_day)
    @orids = current_user.orids.order("id desc").limit(4) if current_user
  end
end
