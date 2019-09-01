class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <YourMaster@testguru.com>}
  layout 'mailer'
end
