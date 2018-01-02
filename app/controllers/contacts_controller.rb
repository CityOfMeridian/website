class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = "Your request was submitted successfully.  Someone at the city will contact you shortly."
    else
      flash[:warning] = error_messages
    end
    redirect_back fallback_location: root_path
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :message, :contact_type)
  end

  def error_messages
    if @contact.errors.messages.has_key?(:email) && @contact.errors.messages.has_key?(:phone)
      "You must provide an email or phone number."
    elsif  @contact.errors.messages.has_key?(:email) || @contact.errors.messages.has_key?(:phone)
      @contact.errors.full_messages.first
    else
      "There was a problem processing your request. Please try again."
    end

  end
end
