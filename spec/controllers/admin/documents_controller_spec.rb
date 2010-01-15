require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::DocumentsController do

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Document.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Document.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Document.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(document_url(assigns[:document]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Document.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Document.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Document.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Document.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Document.first
    response.should redirect_to(document_url(assigns[:document]))
  end

  it "destroy action should destroy model and redirect to index action" do
    document = Document.first
    delete :destroy, :id => document
    response.should redirect_to(documents_url)
    Document.exists?(document.id).should be_false
  end
end
