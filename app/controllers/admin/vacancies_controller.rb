class Admin::VacanciesController < ApplicationController

  def new
    @vacancy = Vacancy.new
  end

  def create
    @vacancy = Vacancy.new(params[:vacancy])
    @vacancy.client_id = current_user.id

    if @vacancy.save
      if params[:commit] == "Submit for approval"
        @vacancy.submit_for_approval!
        flash[:success] = "Vacancy submitted for approval"
      else
        flash[:success] = "Vacancy saved to drafts"
      end
      redirect_to edit_admin_vacancy_path(@vacancy)
    else
      render :action => 'new'
    end
  end

  def edit
    @vacancy = Vacancy.find_by_id(params[:id])
  end

  def index
    @status = params[:status] ||= 'draft'
    @vacancies = Vacancy.find_by_owner_and_status(current_user.id, @status)
  end

  def show
  end

  def destroy
    if Vacancy.destroy(params[:id])
      flash[:success] = "Vacancy deleted"
      redirect_to :back
    end
  end




end
