class ContactController < ApplicationController
  layout "main"

  def index
    # render index.html.erb
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
