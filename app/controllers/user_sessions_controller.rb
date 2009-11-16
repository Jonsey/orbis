class UserSessionsController < ApplicationController

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:success] = "Welcome #{current_user.login}"
      set_lockdown_values
      redirect_to admin_pages_path
    else
      render :action => :new
    end
  end


  private

  def set_lockdown_values
    if user = @user_session.user
      add_lockdown_session_values(user)
    end
  end


end
