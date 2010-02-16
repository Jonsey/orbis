class AddVacancyContact < ActiveRecord::Migration
  def self.up
    add_column :vacancies, :staff_id, :integer
    add_index :vacancies, :staff_id
  end

  def self.down
    remove_index :vacancies, :staff_id
    remove_column :vacancies, :staff_id
  end
end
