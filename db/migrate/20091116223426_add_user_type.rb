class AddUserType < ActiveRecord::Migration
  def self.up
    add_column :users, :type, :string
    add_index :users, :type
  end

  def self.down
    remove_index :users, :type
    remove_column :users, :type
  end
end
