class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[ edit show update destroy start ]
  before_action :find_user, only: %i[ start new ]

  def index
    @tests = Test.all
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def new
    @test = Test.new
  end

  def edit; end

  def show
    @questions = @test.questions
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :new
    end
  end

  def destroy
    @test.destroy

    redirect_to tests_path
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.result(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:category_id, :title, :level, :author_id)
  end

  def find_user
    @user = User.find(session[:user_id])
  end
end
