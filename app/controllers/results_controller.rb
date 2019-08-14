class ResultsController < ApplicationController

  before_action :set_test_passage, only: %i[ show update resume ]

  def show
  end

  def resume
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      byebug
      redirect_to resume_result_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = Result.find(params[:id])
  end
end
