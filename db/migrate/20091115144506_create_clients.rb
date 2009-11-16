class CreateClients < ActiveRecord::Migration
  def self.up
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :telephone, :string
    add_column :users, :company_name, :string

    add_index :users, :company_name
  end

  def self.down
    remove_column :users, :firstname
    remove_column :users, :lastname
    remove_column :users, :telephone
    remove_column :users, :company_name

    remove_index :users, :company_name
  end
end
