class VacanciesController < ApplicationController
  layout 'main'

  def show
    @vacancy = Vacancy.find(params[:id])
  end

  def index
    @technology_vacancies = Vacancy.technology_vacancies.paginate :per_page => 5, :page => params[:pt], :order => 'created_at DESC'
    @finance_vacancies = Vacancy.finance_vacancies.paginate :per_page => 5, :page => params[:pa], :order => 'created_at DESC'
  end

end
