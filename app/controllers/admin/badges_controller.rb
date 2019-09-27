class Admin::BadgesController < Admin::BaseController

  def index
    @badges = Badge.all
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badge_path(@badge), notice: "Badge created"
    else
      render :new
    end
  end

  def new
    @badge = Badge.new
  end

  def edit
    @badge = Badge.find(params[:id])
  end

  def show
    @badge = Badge.find(params[:id])
  end

  def update
    @badge = Badge.find(params[:id])

    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge)
    else
      render :edit
    end
  end

  def destroy
    @badge = Badge.find(params[:id])

    @badge.destroy

    redirect_to admin_badges_path
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :description)
  end
end
