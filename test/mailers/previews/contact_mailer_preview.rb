# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def contact_notification_email
    ContactMailer.contact_notification_email(Contact.first)
  end
end
