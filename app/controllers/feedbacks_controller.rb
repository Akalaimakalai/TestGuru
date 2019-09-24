class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid?
      FeedbacksMailer.feedback_created(@feedback).deliver_now
      redirect_to tests_path
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:body, :from, :email)
  end
end
