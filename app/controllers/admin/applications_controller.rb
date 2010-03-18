class Admin::ApplicationsController < ApplicationController
  def index
    if current_user.is_a?(Candidate)
      @status = "live"
      @vacancies = current_user.vacancies
    else
      @vacancies = Vacancy.all
    end
  end

  def show
  end

end
