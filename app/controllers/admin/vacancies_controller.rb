class Admin::VacanciesController < ApplicationController

  def new
    @vacancy = Vacancy.new
  end

  def create
    @vacancy = Vacancy.new(params[:vacancy])
    @vacancy.client_id = current_user.id

    if @vacancy.save
      if params[:commit] == "Submit for approval"
        @vacancy.submit_for_approval
        @vacancy.save(false)
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

  def update
    @vacancy = Vacancy.find(params[:id])

    if @vacancy.update_attributes(params[:vacancy])

      flash[:success] =  case params[:commit]
                         when "Submit for approval"
                           @vacancy.submit_for_approval
                           @vacancy.save(false)
                           "Vacancy updated and submitted for approval"
                         when "Approve"
                           @vacancy.approve!
                           "Vacancy approved"
                         when "Archive"
                           @vacancy.archive!
                           "Vacancy archived"
                         else
                           "Vacancy updated"
                         end

      redirect_to [:admin, @vacancy]
    else
      render :action => :edit
    end
  end

  def index
    @status = @page_title = process_index_request
    @vacancies = case current_user
                 when Client
                   Vacancy.find_by_owner_and_status(current_user.id, @status)
                 when Candidate
                   @page_title = "Hot"
                   Vacancy.find_all_by_status('live')
                 else
                   Vacancy.find_all_by_status(@status)
                 end.paginate :per_page => 1, :page => params[:pt], :order => 'created_at DESC'
  end

  def show
    @vacancy = Vacancy.find_by_id(params[:id])
  end

  def destroy
    if Vacancy.delete(params[:id])
      flash[:success] = "Vacancy deleted"
      redirect_to :back
    else
      flash[:error] = "There was a problem deleting the vacancy"
      redirect_to :back
    end
  end

  private

  def process_index_request
    default_state = current_user.default_vacancies_list
    redirect_to admin_vacancies_path(:status => default_state) unless params[:status]
    params[:status] ||= default_state
  end





end
