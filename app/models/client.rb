class Client < User
  has_many :vacancies
  attr_accessible :firstname, :lastname, :telephone, :company_name

  validates_presence_of :firstname, :lastname, :telephone, :company_name

  def to_s
    "(#{company_name.camelize}) #{firstname} #{lastname}"
  end

  def default_vacancies_list
    'draft'
  end

  def has_live_vacancies?
    !live_vacancies.empty?
  end

  def live_vacancies
    vacancies.with_status("live")
  end
  
  def deliver_welcome!
    reset_perishable_token!
    Notification.deliver_client_welcome(self)
  end

  default_scope :order => "company_name, lastname, firstname"

end
