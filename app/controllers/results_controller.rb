class ResultsController < ApplicationController
  before_action :set_test_passage, only: %i[ show update resume ]

  def show
    set_q_number
  end

  def resume
    @percent = (@test_passage.correct_questions.to_f / @test_passage.test.questions.count.to_f) * 100
  end

  def update
    if params[:answer_ids].nil?
      set_q_number
      render :show
    else

      @test_passage.accept!(params[:answer_ids])

      if @test_passage.completed?
        redirect_to resume_result_path(@test_passage)
      else
        set_q_number
        render :show
      end
    end
  end

  private

  def set_test_passage
    @test_passage = Result.find(params[:id])
  end

  def set_q_number
    @arr = @test_passage.test.questions.order(id: :asc).pluck(:id)
    @q_number = @arr.find_index(@test_passage.current_question.id) + 1
  end
end
