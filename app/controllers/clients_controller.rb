class ClientsController < ApplicationController
  layout 'main'


  def index

  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(params[:client])
    @client.user_groups << UserGroup.find_by_name('Clients')
    if @client.save
      add_lockdown_session_values
      flash[:notice] = "Account created."
      Notification.deliver_client_welcome(@client)
      redirect_to new_admin_vacancy_url
    else
      render :action => 'new'
    end
  end
end
