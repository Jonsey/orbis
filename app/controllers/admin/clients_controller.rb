class Admin::ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

 def new
    @client = Client.new
  end

  def create
    @client = Client.new(params[:client])
    @client.user_groups << UserGroup.find_by_name('Clients')
    if @client.save
      add_lockdown_session_values
      flash[:notice] = "Account created.."
      redirect_to admin_clients_path
    else
      render :action => 'new'
    end
  end

  def edit
    @client = Client.find_by_id(params[:id])
  end

  def update
    @client = Client.find_by_id(params[:id])
    if @client.update_attributes(params[:client])
      flash[:success] = "Account updated!"
      redirect_to admin_clients_url
    else
      render :action => :edit
    end
  end
end
