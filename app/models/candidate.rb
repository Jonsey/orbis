class Candidate < User
  validates_presence_of :firstname, :lastname, :telephone

  def default_vacancies_list
    'live'
  end

end
