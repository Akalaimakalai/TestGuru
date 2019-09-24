class FeedbacksMailer < ApplicationMailer

  default to: 'jackshaakara@gmail.com',
          from: @feedback.email

  def feedback_created(feedback)
    @feedback = feedback

    mail
  end
end
