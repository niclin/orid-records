module ApplicationHelper
  def render_paid_status(user)
    if user.is_paid
      content_tag(:span, "黃金會員", :class => "label label-success")
    else
      content_tag(:span, "免費會員", :class => "label label-default")
    end
  end

  def render_user_avatar
    if current_user.avatar.present?
      image_tag(current_user.avatar.url)
    else
      '暫無頭像'
    end
  end
end
