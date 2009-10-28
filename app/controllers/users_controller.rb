class UsersController < ApplicationController
  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    if @user.save
      add_lockdown_session_values
      flash[:notice] = "Account created"
      redirect_to account_path
    else
      render :action => 'new'
    end
  end

  def show
    @user = current_user
  end


end
