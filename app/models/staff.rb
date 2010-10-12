class Staff < User
  has_many :vacancies
  attr_accessible :firstname, :lastname, :telephone

  def has_vacancies_awaiting_approval?
    !vacancies_awaiting_approval.empty?
  end

  def has_live_vacancies?
    !live_vacancies.empty?
  end

  def vacancies_awaiting_approval
    vacancies.with_status("awaiting_approval")
  end

  def live_vacancies
    vacancies.with_status("live")
  end

  default_scope :order => "lastname, firstname"

end
