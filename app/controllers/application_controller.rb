class ApplicationController < ActionController::Base
  include ReCaptcha::AppHelper
  
  helper :all
  protect_from_forgery

  filter_parameter_logging :password, :password_confirmation
  helper_method \
  :current_user_session, :current_user,
  :logged_in?, :current_user_is_admin?

  protected

  def clear_authlogic_session
    sess = current_user_session
    sess.destroy if sess
  end

  private

  def successful_login_path
    return session[:return_to_vacancy] unless (!current_user.kind_of?(Candidate) or session[:return_to_vacancy].nil?)
    case current_user
    when Client; new_admin_vacancy_path
    when Candidate; admin_vacancies_path(:status => :live)
    when Staff; admin_vacancies_path(:status => :awaiting_approval)
    else admin_vacancies_path if current_user_is_admin?
    end
  end


  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

end
