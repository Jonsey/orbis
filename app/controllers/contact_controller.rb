class ContactController < ApplicationController
  layout "main"

  def index
    # render index.html.erb
  end

  def create
    if Notification.deliver_contact(params[:contact])
      debugger
      flash[:notice] = "Email was successfully sent."
      redirect_to(contact_path)
    else
      flash.now[:error] = "An error occurred while sending this email."
      render :index
    end
  end

end
