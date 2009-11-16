class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string  :name, :controller, :action, :parameters
      t.integer :parent_id, :lft, :rgt
    end

    add_index :pages, ["name", "parent_id"],
              :name => "index_page_on_name_and_parent_id",
              :unique => false
  end

  def self.down
    drop_table :pages
  end
end
