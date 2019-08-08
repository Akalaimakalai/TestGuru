module ApplicationHelper
  def today_year
    Time.now.year
  end

  def git_sauce(link, link_title)
    link_to link_title, link, target: "_blank"
  end
end
