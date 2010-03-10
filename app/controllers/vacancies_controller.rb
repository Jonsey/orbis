class VacanciesController < ApplicationController
  layout 'main'

  def show
    session[:return_to_vacancy] = request.request_uri
    @vacancy = Vacancy.find(params[:id])
  end

  def apply
    @vacancy = Vacancy.find(params[:id])
    if current_user.is_a?(Candidate)
      @vacancy.candidates << current_user unless @vacancy.candidates.include?(current_user)
      if @vacancy.save
        session[:return_to_vacancy] = nil
        flash[:notice] = "Staff have been notified of your application. You can view your current applications from the <a href='/admin/applications'>control panel</a>"

      end
    else
      flash[:error] = "You must be logged in as a Candidate to apply for vacancies."
    end
    redirect_to @vacancy
  end

  def index
    @technology_vacancies = Vacancy.with_category("Technology").with_status("Live").paginate :per_page => 5, :page => params[:pt], :order => 'created_at DESC'
    @finance_vacancies = Vacancy.with_category("Accountancy & Finance").with_status("Live").paginate :per_page => 5, :page => params[:pa], :order => 'created_at DESC'
  end

end
