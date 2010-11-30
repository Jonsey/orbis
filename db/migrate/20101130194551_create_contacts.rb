class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string	  :firstname, :lastname, :company_name, :telephone, :enquiry
      t.string    :email,               :null => false
    end
  end

  def self.down
    drop_table :contacts
  end
end
