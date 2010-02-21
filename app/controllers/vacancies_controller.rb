class VacanciesController < ApplicationController
  layout 'main'

  def show
    session[:return_to_vacancy] = request.request_uri
    @vacancy = Vacancy.find(params[:id])
  end

  def apply
    @vacancy = Vacancy.find(params[:id])
    @vacancy.candidates << current_user unless @vacancy.candidates.include?(current_user)
    if @vacancy.save
      flash[:notice] = "Staff have been notified of your application. You can view your current applications from the <a href='/admin/applications'>control panel</a>"
    end
    redirect_to @vacancy
  end

  def index
    @technology_vacancies = Vacancy.with_category("Technology").paginate :per_page => 5, :page => params[:pt], :order => 'created_at DESC'
    @finance_vacancies = Vacancy.with_category("Accountancy & Finance").paginate :per_page => 5, :page => params[:pa], :order => 'created_at DESC'
  end

end
