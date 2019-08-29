class Admin::TestsController < Admin::BaseController
  
  before_action :find_test, only: %i[ edit show update destroy start ]

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
    current_user.tests.push(@test)
    redirect_to current_user.result(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:category_id, :title, :level, :author_id)
  end
end
