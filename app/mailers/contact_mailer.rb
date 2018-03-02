class ContactMailer < ApplicationMailer
  def contact_notification_email(contact)
    @contact = contact
    mail(to: ENV.fetch('CITY_ADMINISTRATOR_EMAIL', 'info@meridiantexas.us'), subject: 'Contact Notification')
  end
end
