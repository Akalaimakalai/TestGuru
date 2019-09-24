class FeedbacksMailer < ApplicationMailer

  default to: 'jackshaakara@gmail.com'

  def feedback_created(feedback)
    @feedback = feedback

    mail subject: "New feedback from: #{@feedback.from}", from: @feedback.email
  end
end
