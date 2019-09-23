class FeedbacksMailer < ApplicationMailer

  def feedback_created(feedback)
    @feedback = feedback
    @user = feedback.user

    mail to: 'jackshaakara@gmail.com'
  end
end
