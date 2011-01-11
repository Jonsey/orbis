class ClientsController < ApplicationController
  layout 'main'


  def index
    @page_title = 'Recruitment Agency Orbis Resourcing Clients – Working With You'
    @meta = 'Orbis Resourcing are a recruitment agency who specialise in sourcing jobs in the technology and financial business sectors. As a client of Orbis Resourcing you will receive many benefits from our training and job sourcing services.'
  end

  def new
    @client = Client.new
    #spamify(@client)
  end

  def create
    @client = Client.new(params[:client])
    @client.user_groups << UserGroup.find_by_name('Clients')
    if validate_recap(params, @client.errors) && @client.save_without_session_maintenance
      @client.deliver_activation_instructions!
      flash[:notice] = "Your account has been created. Please check your e-mail for your account activation instructions!"
      redirect_to root_url
    else
      #spamify(@client)
      render :action => 'new'
    end
  end
end
