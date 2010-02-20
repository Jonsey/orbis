class AddCategoryData < ActiveRecord::Migration
  def self.up
    cat1 = Category.create(:name => "Accountancy & Finance")
    cat2 = Category.create(:name => "Technology")
  end

  def self.down
    Category.delete_all
  end
end
