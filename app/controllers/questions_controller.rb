class QuestionsController < ApplicationController
  before_action :find_test, only: %i[ index create new ]
  before_action :find_question, only: %i[ edit show update destroy ]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index; end

  def create
    @test.questions.create!(question_params)

    redirect_to test_questions_path(@test)
  end

  def new; end

  def edit; end

  def show
    render plain: @question.body
  end

  def update
    @question.update!(question_params)

    redirect_to test_questions_path(@question.test)
  end

  def destroy
    @question.destroy

    redirect_to test_questions_path(@question.test)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
