require 'spec_helper'

describe Page do
  before(:each) do
    @root = {
      :name => 'Clients'
    }
    @child = {
      :name => 'Draft Vacancies',
      :parent_id => 1,
      :controller => 'admin/vacancies',
      :action => 'index',
      :parameters => ':status => :draft'
    }
  end

  describe "Create a new root page" do
    it "should create a new instance given valid attributes" do
      Page.create!(@root)
    end

    it "should be invalid without a name" do
      Page.new(@root.except(:name)).should_not be_valid
    end
  end

  describe "Create a new child page" do
    before(:each) do
      @parent = Page.create!(@root)
      @child[:proposed_parent_id] = @parent
    end

    it "should create a new instance as a child of parent given valid attributes" do
      Page.create!(@child).parent_id.should eql(@parent.id)
    end

    it "should be invalid without a controller" do
      Page.new(@child.except(:controller)).should_not be_valid
    end
    it "should be invalid without a action" do
      Page.new(@child.except(:action)).should_not be_valid
    end
  end
end
