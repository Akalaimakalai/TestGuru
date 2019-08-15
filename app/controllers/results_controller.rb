class ResultsController < ApplicationController

  before_action :set_test_passage, only: %i[ show update resume ]

  def show
  end

  def resume
    @percent = (@test_passage.correct_questions.to_f / @test_passage.test.questions.count.to_f) * 100
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      redirect_to resume_result_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = Result.find(params[:id])
    @test_passage.q_number ||= 1
  end
end
