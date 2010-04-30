class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

 def show
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


  def destroy
    @user = User.find(params[:id])

    @user.destroy
    flash[:notice] = "User account was removed."

    redirect_to admin_users_url
  end
end
