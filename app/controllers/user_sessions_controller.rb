class UserSessionsController < ApplicationController
  after_filter :set_lockdown_values, :only => :create

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:success] = "Welcome #{current_user.login}"
      redirect_to account_path
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
