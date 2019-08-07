class TestsController < ApplicationController
  before_action :find_test, only: %i[ edit show update destroy ]

  def index; end

  def create
    Test.create!(test_params)

    redirect_to tests_path
  end

  def new; end

  def edit; end

  def show
    redirect_to test_questions_path(@test)
  end

  def update
    @test.update!(test_params)

    redirect_to tests_path
  end

  def destroy
    @test.destroy

    redirect_to tests_path
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:category_id, :title, :level, :author_id)
  end
end
