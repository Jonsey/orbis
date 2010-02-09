class Category < ActiveRecord::Base
  has_many :vacancies

  def to_s
    name
  end

end
