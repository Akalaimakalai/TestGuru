class FeedbacksMailer < ApplicationMailer

  default to: 'jackshaakara@gmail.com'

  def feedback_created(feedback)
    @feedback = feedback

    mail
  end
end
