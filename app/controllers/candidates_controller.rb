class CandidatesController < ApplicationController
  layout 'main'


  def index
    @page_title = 'Accounting and Finance Jobs and IT Recruitment Agency Orbis Resourcing in the UK - Candidates'
    @meta = 'Orbis Resourcing are an accounting, finance jobs and IT recruitment agency based in the UK. As a candidate seeking permanent and/or contract positions, Orbis will provide you with a wide variety of rewarding and challenging opportunities.'
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
