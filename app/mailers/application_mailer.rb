# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'Standerd Media',
          bcc: 'sent@gmail.com',
          reply_to: 'reply@gmail.com'
  layout 'mailer'
end
