require 'spec_helper'

describe Admin::PagesController do
  before(:each) do
    login_admin
  end
  describe "Index" do
    it "should assign menu to an instance variable" do
      @pages = [mock_model(Page)]
      Page.should_receive(:find).with(:all).and_return(@pages)

      get :index
      assigns[:pages].should eql(@pages)
    end
  end

end
