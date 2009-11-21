class UserSessionsController < ApplicationController

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save!
      flash[:success] = "Welcome #{current_user.login}"
      set_lockdown_values
      redirect_to successful_login_path
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    reset_lockdown_session
    flash[:notice] = "You have been logged out!"
    redirect_to root_path
  end


  private

  def successful_login_path
    case current_user
      when Client; new_admin_vacancy_path
      when Candidate; admin_vacancies_url(:status => :live)
      else admin_pages_path if current_user_is_admin?
    end
  end


  def set_lockdown_values
    if user = @user_session.user
      add_lockdown_session_values(user)
    end
  end


end