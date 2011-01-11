class UserSessionsController < ApplicationController
  layout 'main'

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if validate_recap(params, @user_session.errors) && @user_session.save
      flash[:success] = "Welcome #{current_user.to_s}"
      set_lockdown_values
      redirect_to successful_login_path
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    reset_lockdown_session
    session[:return_to_vacancy] = nil
    flash[:notice] = "You have been logged out!"
    redirect_to root_path
  end


  private



  def set_lockdown_values
    if user = @user_session.user
      add_lockdown_session_values(user)
    end
  end


end
