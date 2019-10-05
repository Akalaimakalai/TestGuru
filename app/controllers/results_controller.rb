class ResultsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_result, only: %i[ show update final gist ]

  def show; end

  def final; end

  def update
    @result.accept!(params[:answer_ids])

    if @result.completed?
      current_user.badges << BadgeService.new(@result).start_checking
      TestsMailer.completed_test(@result).deliver_now
      redirect_to final_result_path(@result)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@result.current_question).call

    if result.success?

      @gist = Gist.new(url_id: result.id,
                       user_id: current_user.id,
                       question_id: @result.current_question.id)
      @gist.save

      flash[:success] = "#{t('.success')} #{view_context.link_to t('.here'),
                                            result.html_url,
                                            target: "_blank"}"
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @result
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end
end
