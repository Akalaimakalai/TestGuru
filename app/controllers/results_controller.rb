class ResultsController < ApplicationController
  before_action :set_result, only: %i[ show update resume ]

  def show; end

  def resume; end

  def update
    return render :show if params[:answer_ids].nil?

    @result.accept!(params[:answer_ids])

    if @result.completed?
      redirect_to resume_result_path(@result)
    else
      render :show
    end
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end
end
