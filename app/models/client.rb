class Client < User
  validates_presence_of :firstname, :lastname, :telephone, :company_name

  def default_vacancies_list
    'draft'
  end

end
