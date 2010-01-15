class Admin::ClientsController < ApplicationController
  def index
  end

  def edit
    @client = Client.find_by_id(params[:id])
  end

  def update
    @client = Client.find_by_id(params[:id])
    if @client.update_attributes(params[:client])
      flash[:success] = "Account updated!"
      redirect_to @client
    else
      render :action => :edit
    end
  end
end
