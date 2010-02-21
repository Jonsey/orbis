class Candidate < User
  has_one :cv
  # has_many :vacancies
  has_and_belongs_to_many :vacancies, :join_table => :applications

  validates_presence_of :firstname, :lastname, :telephone

  accepts_nested_attributes_for :cv

  def default_vacancies_list
    'live'
  end

end
