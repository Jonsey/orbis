class Admin::CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def edit
    @candidate = Candidate.find_by_id(params[:id])
    @candidate.build_cv
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

end
