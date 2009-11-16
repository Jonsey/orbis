require 'spec_helper'

describe Candidate do
  before(:each) do
    @valid_attributes = {
      :login => 'damian.jones',
      :password => 'password',
      :password_confirmation => 'password',
      :firstname => 'Damian',
      :lastname => 'Jones',
      :email => 'damian.jones@example.com',
      :telephone => '07010 717232'
    }
  end

  it "should create a new instance given valid attributes" do
    Candidate.create!(@valid_attributes)
  end

  it "should be invalid without firstname" do
    Candidate.new(@valid_attributes.except(:firstname)).should_not be_valid
  end

  it "should be invalid without last name" do
    Candidate.new(@valid_attributes.except(:lastname)).should_not be_valid
  end

  it "should be invalid without telephone" do
    Candidate.new(@valid_attributes.except(:telephone)).should_not be_valid
  end
end
