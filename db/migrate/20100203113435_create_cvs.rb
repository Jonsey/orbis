class CreateCvs < ActiveRecord::Migration
  def self.up
    create_table :cvs do |t|
      t.integer :candidate_id, :null => false
      t.string :title, :item_file_name, :item_content_type, :item_file_size
      t.timestamps
    end
  end

  def self.down
    drop_table :cvs
  end
end
