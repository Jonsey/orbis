require 'spec_helper'

describe Vacancy do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    Vacancy.create!(@valid_attributes)
  end
end
