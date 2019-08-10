module ApplicationHelper
  def today_year
    Time.current.year
  end

  def git_sauce(author, repo)
    link_to "#{repo}", "https://github.com/#{author}/#{repo}", target: "_blank"
  end
end
