class ApplicationMailer < ActionMailer::Base
  default from: 'info@meridiantexas.us'
  layout 'mailer'
  helper :email
end
