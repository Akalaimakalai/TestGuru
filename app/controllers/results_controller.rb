class ResultsController < ApplicationController
  before_action :set_result, only: %i[ show update final ]

  def show; end

  def final; end

  def update
    @result.accept!(params[:answer_ids])

    if @result.completed?
      redirect_to final_result_path(@result)
    else
      render :show
    end
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end
end
