class FeedbacksMailer < ApplicationMailer

  def feedback_created(feedback)
    @feedback = feedback

    mail to: 'jackshaakara@gmail.com'
  end
end
