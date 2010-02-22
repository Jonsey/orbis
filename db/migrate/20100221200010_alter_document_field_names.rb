class AlterDocumentFieldNames < ActiveRecord::Migration
  def self.up
    rename_column :documents, :item_file_name, :white_paper_file_name
    rename_column :documents, :item_content_type, :white_paper_content_type
    rename_column :documents, :item_file_size, :white_paper_file_size
    rename_column :documents, :item_updated_at, :white_paper_updated_at
  end

  def self.down
    rename_column :documents, :white_paper_file_name, :item_file_name
    rename_column :documents, :white_paper_content_type, :item_content_type
    rename_column :documents, :white_paper_file_size, :item_file_size
    rename_column :documents, :white_paper_updated_at, :item_updated_at
  end
end
