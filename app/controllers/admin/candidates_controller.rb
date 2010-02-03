class Admin::CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def edit
    @candidate = Candidate.find_by_id(params[:id])
  end

  def update
    @candidate = Candidate.find_by_id(params[:id])
    if @candidate.update_attributes(params[:candidate])
      flash[:success] = "Account updated!"
      redirect_to @candidate
    else
      render :action => :edit
    end
  end

end
