class ClientsController < ApplicationController

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(params[:client])
    @client.user_groups << UserGroup.find_by_name('Clients')
    if @client.save
      add_lockdown_session_values
      flash[:notice] = "Account created."
      redirect_to admin_vacancies_url(:status => :live)
    else
      render :action => 'new'
    end
  end
end
