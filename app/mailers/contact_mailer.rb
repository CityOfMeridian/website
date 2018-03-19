class ContactMailer < ApplicationMailer
  def contact_notification_email(contact)
    @contact = contact
    city_admin = ENV.fetch('CITY_ADMINISTRATOR_EMAIL', 'info@meridiantexas.us')
    city_secretary = ENV.fetch('CITY_SECRETARY_EMAIL', 'info@meridiantexas.us')
    mail(to: city_admin, subject: 'Contact Notification').deliver_now
    mail(to: city_secretary, subject: 'Contact Notification').deliver_now
  end
end
