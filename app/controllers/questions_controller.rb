class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @category = find_test.category.title
    @questions = Question.where(test_id: params[:test_id])
  end

  def create
    question = Question.create!(question_params)

    redirect_to test_questions_path
  end

  def new
  end

  def edit
  end

  def show
    render plain: Question.find(params.require(:id)).question
  end

  def update
  end

  def destroy
    question = Question.find(params[:id])
    test_id = question.test_id
    question.destroy

    redirect_to "http://localhost:3000/tests/#{test_id}/questions"
  end

  private

  def question_params
    params.require(:question).permit(:question, :test_id)
  end

  def find_test
    Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
