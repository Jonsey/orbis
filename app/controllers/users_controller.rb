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

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Account updated!"
      redirect_to @user
    else
      render :action => :edit
    end
  end


  def show
    @user = current_user
  end


end
