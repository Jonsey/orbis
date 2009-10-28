require 'spec_helper'

describe UsersController do

  describe "as a admin user" do
    before do
      login_admin
    end

    it "should allow all access" do
      allowed_actions.should == all_actions
    end
  end

  describe "as a standard user" do
    before do
      login_standard
    end

    it "should allow access only to [:new, :create]" do
      allowed_actions.should ==  []
    end
  end

  describe "as a public user" do
    before do
      public_user
    end

    it "should allow access to only show" do
      allowed_actions.should ==  only_actions(:new, :create)
    end
  end








end
