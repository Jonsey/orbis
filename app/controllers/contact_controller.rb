class ContactController < ApplicationController
  layout "main"

  def index
    # render index.html.erb
    @page_title = 'Contact Information for Orbis Resourcing based in the UK'
    @meta = 'Here you will find information to contact Orbis Resourcing for all your UK based finance and IT job sourcing requirements.'
  end

  def create
    if Notification.deliver_contact(params[:contact], params[:subject])
      flash[:notice] = "Enquiry was successfully sent."
      redirect_to(contact_path)
    else
      flash.now[:error] = "An error occurred while sending this enquiry."
      render :index
    end
  end

end
