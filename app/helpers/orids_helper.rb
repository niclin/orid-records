module OridsHelper
  def render_orid_status(orid)
    tag = orid.status == "public" ? "label-success" : "label-default"
    content_tag(:span, t(orid.status, :scope => "orid.status"), :class => "label #{tag}")
  end
end
