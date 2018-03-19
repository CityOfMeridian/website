class ContactNotificationEmailJob < ApplicationJob
  queue_as :default

  def perform(contact)
    ContactMailer.contact_notification_email(contact)
  end
end
