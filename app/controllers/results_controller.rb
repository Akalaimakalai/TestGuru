class ResultsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_result, only: %i[ show update final gist ]

  def show; end

  def final; end

  def update
    @result.accept!(params[:answer_ids])

    if @result.completed?
      TestsMailer.completed_test(@result).deliver_now
      redirect_to final_result_path(@result)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@result.current_question,
    client: Octokit::Client.new(access_token: '0cd5257617f66bf192af118baa91155ea7c7f8bd')).call

    flash_options = if result.success?
      { notice: t('.success') }
    else
      { notice: t('.failure') }
    end

    redirect_to @result, flash_options
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end
end
