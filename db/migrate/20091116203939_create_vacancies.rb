class CreateVacancies < ActiveRecord::Migration
  def self.up
    create_table :vacancies do |t|
      t.string  :title, :null => false
      t.string  :role, :salary, :location, :duration, :status
      t.text    :key_skills, :role_description
      t.integer :client_id, :null => false

      t.timestamps
    end

    add_index :vacancies, :client_id
    add_index :vacancies, :status

  end

  def self.down
    drop_table :vacancies
  end
end
