require 'spec_helper'

describe "/categories/show.html.erb" do
  include Admin::CategoriesHelper
  before(:each) do
    assigns[:category] = @category = stub_model(Category,
      :category_id => 1,
      :name => "value for name",
      :parent_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/value\ for\ name/)
    response.should have_text(/1/)
  end
end
