class Admin::CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
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
      flash[:notice] = "Account created.."
      redirect_to admin_candidates_path
    else
      render :action => 'new'
    end
  end

  def edit
    @candidate = Candidate.find_by_id(params[:id])
    @candidate.build_cv unless @candidate.cv
  end

  def show
    @candidate = Candidate.find_by_id(params[:id])
   # @candidate.build_cv
  end

  def update
    @candidate = Candidate.find_by_id(params[:id])
    if @candidate.update_attributes(params[:candidate])
      flash[:success] = "Account updated!"
      if (current_user_is_admin? || current_user.is_a?(Staff))
        redirect_to admin_candidates_url
      else
        redirect_to edit_admin_candidate_url @candidate
      end
    else
      render :action => :edit
    end
  end

  def destroy
    @candidate = Candidate.find(params[:id])
    @candidate.destroy
    flash[:notice] = "Candidate account was removed."
    redirect_to admin_candidates_url
  end

end
