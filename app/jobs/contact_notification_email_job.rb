class ContactNotificationEmailJob < ApplicationJob
  queue_as :default

  def perform(contact)
    notification_to_emails.each do |email|
      ContactMailer.contact_notification_email(contact, email).deliver_now
    end
  end

  def notification_to_emails
    [ 
      ENV.fetch('CITY_ADMINISTRATOR_EMAIL', 'info@meridiantexas.us'), 
      ENV.fetch('CITY_SECRETARY_EMAIL', 'info@meridiantexas.us')
    ]
  end
end
