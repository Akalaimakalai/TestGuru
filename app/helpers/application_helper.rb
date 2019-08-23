module ApplicationHelper
  def today_year
    Time.current.year
  end

  def git_url(author, repo)
    link_to "#{repo}", "https://github.com/#{author}/#{repo}", target: "_blank"
  end

  def help_me_flash(type)
    if flash[type.to_sym]
      content_tag :p, flash[type.to_sym], class: "flash #{type}"
    end
  end
end
