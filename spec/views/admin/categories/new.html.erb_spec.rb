require 'spec_helper'

describe "/categories/new.html.erb" do
  include Admin::CategoriesHelper

  before(:each) do
    assigns[:category] = stub_model(Category,
      :new_record? => true,
      :category_id => 1,
      :name => "value for name",
      :parent_id => 1
    )
  end

  it "renders new category form" do
    render

    response.should have_tag("form[action=?][method=post]", categories_path) do
      with_tag("input#category_category_id[name=?]", "category[category_id]")
      with_tag("input#category_name[name=?]", "category[name]")
      with_tag("input#category_parent_id[name=?]", "category[parent_id]")
    end
  end
end
