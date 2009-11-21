require 'spec_helper'

describe Admin::VacanciesController do

  describe "Logged in as a client" do
    def mock_user
      mock_model  Client,
                  :login => 'John',
                  :email  => 'email@example.com',
                  :password   => "mysecret",
                  :password_confirmation   => "mysecret",
                  :null_object => true
    end

    before(:each) do
      login_with_groups(:clients)
      @current_user.stub!(:default_vacancies_list).and_return('draft')
    end

    it "should use Admin::UsersController" do
      controller.should be_an_instance_of(Admin::VacanciesController)
    end

    describe "New" do
      it "should create a new vacancy" do
        Vacancy.should_receive(:new)
        get :new
        response.should be_success
      end

      it "should assign vacancy" do
        @vacancy = mock_model(Vacancy)
        Vacancy.should_receive(:new).and_return(@vacancy)
        get :new
        assigns[:vacancy].should eql(@vacancy)
      end
    end

    describe "creating a new vacancy" do
      before(:each) do
        @params = { :vacancy => { "title" => "Title", "role" => "Role"}}
        @vacancy = mock_model(Vacancy, :null_object => true)
        Vacancy.stub!(:new).and_return(@vacancy)
      end

      it "should create a new vacancy from params" do
        Vacancy.should_receive(:new).with(@params[:vacancy])
        put :create, @params
      end

      it "should associate the vacancy with the current user" do
        @vacancy.should_receive(:client_id=).with(@current_user.id)
        put :create, @params
      end

      describe "Successful save" do
        before(:each) do
          @vacancy.stub!(:save).and_return(true)
          put :create, @params
        end

        it "should flash 'Vacancy saved to drafts'" do
          flash[:success].should eql("Vacancy saved to drafts")
        end

        it "should redirect to edit" do
          response.should redirect_to(edit_admin_vacancy_path(@vacancy))
        end
      end
    end

    describe "Editing" do
      describe "my  vacancy" do
        it "should be successful" do
          @vacancy = mock_model(Vacancy)
          Vacancy.stub!(:find).and_return(@vacancy)
          get :edit, :id => 1
          response.should be_success
        end
      end
      describe "someone else's vacancy" do
        it "should not be successful" do
          @vacancy = mock_model(Vacancy, :client_id => @current_user.id + 1)
          Vacancy.stub!(:find).and_return(@vacancy)
          get :edit, :id => 1
          assigns[:vacancy].should eql(nil)
          response.should_not be_success
        end
      end
    end

    describe "Index" do
      before(:each) do
        controller.stub!(:current_user).and_return(@current_user)
        @vacancy = mock_model(Vacancy, :null_object => true)
        Vacancy.stub!(:find).and_return(@vacancy)
      end

      it "should filter draft vacancies belonging to current user" do
        Vacancy.should_receive(:find_by_owner_and_status).with(@current_user.id, 'draft')
        get :index
      end

      it "should assign vacancies" do
        get :index
        assigns[:vacancies].should eql(@vacancy)
      end

      it "should assign the status to draft" do
        get :index
        assigns[:status].should eql('draft')
      end
      it "should assign the status to awaiting approval" do
        params = { :status => 'awaiting_approval' }
        get :index, params

        assigns[:status].should eql('awaiting_approval')
      end
    end
  end

  describe "Logged in as a admin" do
    before(:each) do
      login_admin
      @current_user.stub!(:default_vacancies_list).and_return('awaiting_approval')
      @vac1 = Factory.build(:vacancy, :client_id => 1, :status => :awaiting_approval)
      @vac2 = Factory.build(:vacancy, :client_id => 2, :status => :awaiting_approval)
      @vac3 = Factory.create(:vacancy, :client_id => 2, :status => :draft)

      Vacancy.stub!(:find_all_by_status).with('awaiting_approval').and_return([@vac1, @vac2])
    end

    describe "listing vacancies awaiting approval" do
      it "should find all awaiting approval vacancies" do
        Vacancy.should_receive(:find_all_by_status).with('awaiting_approval')
        get :index, :status => 'awaiting_approval'
      end
    end
  end

  describe "Logged in as a candidate" do
    def mock_user
      mock_model  Candidate,
                  :login => 'John',
                  :email  => 'email@example.com',
                  :password   => "mysecret",
                  :password_confirmation   => "mysecret",
                  :null_object => true
    end
    before(:each) do
      login_admin
      @current_user.stub!(:default_vacancies_list).and_return('live')
      @vac1 = Factory.build(:vacancy, :client_id => 1, :status => :live)
      @vac2 = Factory.build(:vacancy, :client_id => 2, :status => :live)
      @vac3 = Factory.create(:vacancy, :client_id => 2, :status => :draft)

      Vacancy.stub!(:find_all_by_status).with('live').and_return([@vac1, @vac2])
    end

    describe "listing vacancies" do
      it "should find all live vacancies" do
        Vacancy.should_receive(:find_all_by_status).with('live')
        get :index
      end
      it "should ignore the status param and select live all the time" do
        Vacancy.should_receive(:find_all_by_status).with('live')
        get :index, :status => 'draft'
      end
    end
  end
end
