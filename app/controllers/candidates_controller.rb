class CandidatesController < ApplicationController
  layout 'main'

  def index

  end

  def new
    @candidate = Candidate.new
    @candidate.build_cv
  end

  def create
    @candidate = Candidate.new(params[:candidate])
    @candidate.user_groups << UserGroup.find_by_name('Candidates')
    if @candidate.save
      add_lockdown_session_values
      flash[:notice] = "Account created."
      Notification.deliver_candidate_welcome(@candidate)
      redirect_to admin_vacancies_url(:status => 'live')
    else
      render :action => 'new'
    end
  end
end
