class ContactMailer < ApplicationMailer
  def contact_notification_email(contact, email=nil)
    @contact = contact
    to_email = email || ENV.fetch('CITY_ADMINISTRATOR_EMAIL', 'info@meridiantexas.us')
    reply_to_email = contact.email.present? ? contact.email : to_email
    mail(to: to_email, reply_to: reply_to_email, subject: 'Contact Notification')
  end
end
