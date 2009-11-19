class CandidatesController < ApplicationController
  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(params[:candidate])
    @candidate.user_groups << UserGroup.find_by_name('Candidates')
    if @candidate.save
      add_lockdown_session_values
      flash[:notice] = "Account created."
      redirect_to admin_vacancies_url(:status => 'live')
    else
      render :action => 'new'
    end
  end
end
