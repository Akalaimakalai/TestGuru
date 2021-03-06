class Admin::TestsController < Admin::BaseController

  before_action :update_inline_redirect, only: %i[ update_inline ]
  before_action :set_tests, only: %i[ index update_inline ]
  before_action :find_test, only: %i[ edit show update update_inline destroy ]

  def index; end

  def create
    @test = current_user.works.new(test_params)

    if @test.save
      redirect_to admin_test_path(@test), notice: t('.success')
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
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy

    redirect_to admin_tests_path
  end

  private

  def set_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:category_id, :title, :level, :author_id, :timer)
  end

  def update_inline_redirect
    redirect_to admin_tests_path unless params["test"]
  end
end
