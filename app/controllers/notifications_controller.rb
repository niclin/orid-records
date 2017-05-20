class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = Notification.where(recipient: current_user).order("id DESC")
    @notifications.update_all(read_at: Time.zone.now)
  end
end
