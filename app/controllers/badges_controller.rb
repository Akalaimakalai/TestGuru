class BadgesController < ApplicationController

  def index
    @badges = current_user.badges
  end

  def index_all
    @badges = Badge.all
  end

  def show; end
end
