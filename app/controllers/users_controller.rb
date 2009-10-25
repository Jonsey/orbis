class UsersController < ApplicationController
  def new
    @user =User.new
  end

  def create
    @user = User.create(params[:user])
    if @user.save
      flash[:notice] = "Account created"
      redirect_back_or_default user_path(@user)
    else
      render :action => 'new'
    end
  end

end
