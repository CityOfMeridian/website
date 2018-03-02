class ContactNotificationEmailJob < ApplicationJob
  queue_as :default

  def perform(contact)
    ContactMailer.contact_notification_email(contact).deliver_now
  end
end
