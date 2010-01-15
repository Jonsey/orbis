class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.string :title, :item_file_name, :item_content_type, :item_file_size, :item_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
