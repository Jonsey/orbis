require 'spec_helper'

describe Client do
  before(:each) do
    @valid_attributes = {
      :password => 'password',
      :password_confirmation => 'password',
      :firstname => 'Damian',
      :lastname => 'Jones',
      :email => 'damian.jones@example.com',
      :telephone => '07010 717232',
      :company_name => 'Damian company'
    }
  end

  it "should create a new instance given valid attributes" do
    Client.create!(@valid_attributes)
  end

  it "should be invalid without firstname" do
    Client.new(@valid_attributes.except(:firstname)).should_not be_valid
  end

  it "should be invalid without last name" do
    Client.new(@valid_attributes.except(:lastname)).should_not be_valid
  end

  it "should be invalid without telephone" do
    Client.new(@valid_attributes.except(:telephone)).should_not be_valid
  end

  it "should be invalid without company name" do
    Client.new(@valid_attributes.except(:company_name)).should_not be_valid
  end
end
