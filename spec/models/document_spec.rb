require 'spec_helper'

describe Document do
  before(:each) do
    @valid_attributes = {
      :title => "value for title"
    }
  end

  it "should create a new instance given valid attributes" do
    Document.create!(@valid_attributes)
  end
end
