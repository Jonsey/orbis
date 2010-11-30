class CandidatesController < ApplicationController
  layout 'main'


  def index
    @page_title = 'Accounting and Finance Jobs and IT Recruitment Agency Orbis Resourcing in the UK - Candidates'
    @meta = 'Orbis Resourcing are an accounting, finance jobs and IT recruitment agency based in the UK. As a candidate seeking permanent and/or contract positions, Orbis will provide you with a wide variety of rewarding and challenging opportunities.'
  end

  def new
    @candidate = Candidate.new
    @candidate.build_cv
    spamify(@candidate)
  end

  def create
    @candidate = Candidate.new(params[:candidate].merge(:possible_answers => session[:possible_answers]))
    @candidate.user_groups << UserGroup.find_by_name('Candidates')
    if @candidate.save_without_session_maintenance
      @candidate.deliver_activation_instructions!
      flash[:notice] = "Your account has been created. Please check your e-mail for your account activation instructions!"
      redirect_to root_url
    else
      spamify(@candidate)
      render :action => 'new'
    end
  end
end
