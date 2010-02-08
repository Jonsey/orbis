class RemoveFieldsFromVacancies < ActiveRecord::Migration
  def self.up
    remove_column :vacancies, :title
    remove_column :vacancies, :duration
    remove_column :vacancies, :key_skills
  end

  def self.down
    add_column :vacancies, :title, :null => false
    add_column :vacancies, :duration, :string
    add_column :vacancies, :key_skills, :string
  end
end
