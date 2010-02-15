class CandidateSessionsController < UserSessionsController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:success] = "Welcome #{current_user.to_s}"
      set_lockdown_values
      redirect_to successful_login_path
    else
      render :action => :new
    end
  end
end
