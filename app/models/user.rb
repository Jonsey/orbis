class User < ActiveRecord::Base
  has_and_belongs_to_many :user_groups

  acts_as_authentic

  def default_vacancies_list
    'awaiting_approval'
  end
end


