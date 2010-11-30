class ContactController < ApplicationController
  layout "main"

  def index
    # render index.html.erb
    @page_title = 'Contact Information for Orbis Resourcing based in the UK'
    @meta = 'Here you will find information to contact Orbis Resourcing for all your UK based finance and IT job sourcing requirements.'
    @contact = Contact.new
    spamify(@contact)
  end

  def create
    @contact = Contact.new(params[:contact].merge(:possible_answers => session[:possible_answers]))
    if(@contact.save) && Notification.deliver_contact(params[:contact], params[:subject])
	flash[:notice] = "Enquiry was successfully sent."
	redirect_to(contact_path)
    else
      spamify(@contact)
      flash.now[:error] = "An error occurred while sending this enquiry."
      render :index
    end
  end

end
