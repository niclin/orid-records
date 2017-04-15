class WelcomeController < ApplicationController

  def index
    @today_orids = Orid.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

end
