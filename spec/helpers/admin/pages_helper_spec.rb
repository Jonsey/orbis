require 'spec_helper'

describe Admin::PagesHelper do
  before(:each) do
    activate_authlogic
  end

  describe "Building path from attributes" do
    it "should concatenate attributes into a hash" do
      page = mock_model(Page,
                        :controller => 'admin/vacancies',
                        :action => 'index')

      helper.path(page).should == {
        :controller => '/admin/vacancies',
        :action => 'index' }
    end

    it "should take the parameter field and use it as the id" do
      page = mock_model(Page,
                        :controller => 'admin/vacancies',
                        :action => 'show',
                        :parameters => 'current_user' )
      controller.should_receive(:current_user).and_return(1)

      helper.path(page).should == {
        :controller => '/admin/vacancies',
        :action => 'show',
        :id => 1 }
    end
  end

end
