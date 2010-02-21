class CreateApplicationJoinTable < ActiveRecord::Migration
  def self.up
    create_table :applications, :id => false do |t|
      t.references :candidate
      t.references :vacancy
      t.timestamps
    end
  end

  def self.down
    drop_table :applications
  end

end
