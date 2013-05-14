ConferenceSite2013::App.helpers do
  # borrowed by admin helpers
  def tag_icon(icon, tag = nil)
    content = content_tag(:i, '', :class => "icon-#{icon.to_s}")
    content << " #{tag.to_s}"
  end
end
