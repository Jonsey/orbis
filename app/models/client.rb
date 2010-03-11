class Client < User
  has_many :vacancies

  validates_presence_of :firstname, :lastname, :telephone, :company_name

  def default_vacancies_list
    'draft'
  end

  def has_live_vacancies?
    !live_vacancies.empty?
  end

  def live_vacancies
    vacancies.with_status("live")
  end

  default_scope :order => "company_name, lastname, firstname"

end
