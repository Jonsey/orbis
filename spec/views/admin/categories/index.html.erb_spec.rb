require 'spec_helper'

describe "/categories/index.html.erb" do
  include Admin::CategoriesHelper

  before(:each) do
    assigns[:categories] = [
      stub_model(Category,
        :category_id => 1,
        :name => "value for name",
        :parent_id => 1
      ),
      stub_model(Category,
        :category_id => 1,
        :name => "value for name",
        :parent_id => 1
      )
    ]
  end

  it "renders a list of categories" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
