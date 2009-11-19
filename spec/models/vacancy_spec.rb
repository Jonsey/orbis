require 'spec_helper'

describe Vacancy do
  before(:each) do
    @valid_attributes = {
      :title            => "Title",
      :role             => "Role",
      :salary           => "40000",
      :location         => "Location",
      :duration         => "Duration",
      :key_skills       => "Skill1, skill2",
      :role_description => "<h1>Description</h1>",
      :client_id        => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Vacancy.create!(@valid_attributes)
  end

  describe "editor_ids" do
    before(:each) do
      ug = mock_model(UserGroup, :null_object => true)
      UserGroup.should_receive(:find_by_name).with(:administrators).and_return(ug)
      ug.should_receive(:user_ids).and_return([2])

      @vacancy = Vacancy.new(@valid_attributes)
      @editors = @vacancy.editor_ids
    end
    it "should contain the vacancies client id" do
      @editors.include?(1).should be_true
    end
    it "should contain all admin user ids" do
      @editors.include?(2).should be_true
    end
  end

end
