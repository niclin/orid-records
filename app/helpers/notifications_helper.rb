module NotificationsHelper
  def render_user_profile_link(user)
    link_to user.name
  end
end
