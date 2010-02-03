class User < ActiveRecord::Base
  has_and_belongs_to_many :user_groups

  acts_as_authentic do |c|
    c.login_field = 'email'
  end


  def default_vacancies_list
    'awaiting_approval'
  end

  def to_s
    "#{firstname} #{lastname}"
  end

end


