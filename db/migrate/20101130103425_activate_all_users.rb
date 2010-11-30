class ActivateAllUsers < ActiveRecord::Migration
  def self.up
     User.update_all ["active = ?", true]
  end

  def self.down
  end
end
