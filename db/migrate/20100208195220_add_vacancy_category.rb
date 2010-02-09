class AddVacancyCategory < ActiveRecord::Migration
  def self.up
    add_column :vacancies, :category_id, :integer
  end

  def self.down
    remove_column :vacancies, :category_id
  end
end
