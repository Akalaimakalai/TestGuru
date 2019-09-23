class FeedbacksController < ApplicationController

  before_action :authenticate_user!

  def new; end

  def create
    current_user.feedbacks.new(feddback_params)

    if @test.save
      redirect_to tests_path
    else
      render :new
    end
  end

  private

  def feddback_params
    params.require(:feedback).permit(:body)
  end
end
