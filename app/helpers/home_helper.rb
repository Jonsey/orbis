module HomeHelper
  def hot_vacancies
    Vacancy.with_status("live")
  end

end
