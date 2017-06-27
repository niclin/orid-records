module ApplicationHelper
  def render_paid_status(user)
    if user.is_paid
      content_tag(:span, "黃金會員", :class => "label label-success")
    else
      content_tag(:span, "免費會員", :class => "label label-default")
    end
  end

  def render_user_avatar(user)
    image_tag(user.avatar.url, class: "comment_account-img", title: user.name) if user.avatar.present?
  end

  def render_orid_title_link(orid)
    link_to simple_format(truncate(Rails::Html::FullSanitizer.new.sanitize(orid.objective), length: 30 )), orid_path(orid)
  end
end
