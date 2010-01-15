class Page < ActiveRecord::Base
  acts_as_nested_set

  validates_presence_of :name
  validates_presence_of :controller, :action, :unless => :proposed_root?

  after_save :move_to_correct_position

  def proposed_parent_id
    @proposed_parent_id
  end

  def proposed_parent_id=(parent)
    @proposed_parent_id = parent
  end

  def self.create_pages
    Page.delete_all

    root = Page.create!(:name => 'Root')

    staff_account = Page.create!(:name => 'Account', :proposed_parent_id => root, :controller => 'admin/users', :action => 'edit', :parameters => 'current_user')
    staff_account = Page.create!(:name => 'Account', :proposed_parent_id => root, :controller => 'admin/staffs', :action => 'edit', :parameters => 'current_user')
    client_account = Page.create!(:name => 'Account', :proposed_parent_id => root, :controller => 'admin/clients', :action => 'edit', :parameters => 'current_user')
    candidate_account = Page.create!(:name => 'Account', :proposed_parent_id => root, :controller => 'admin/candidates', :action => 'edit', :parameters => 'current_user')

    users = Page.create!(:name => 'Users', :proposed_parent_id => root, :controller => 'admin/users', :action => 'index')
    list_users = Page.create!(:name => 'List', :proposed_parent_id => users, :controller => 'admin/users', :action => 'index')
    new_user = Page.create!(:name => 'New', :proposed_parent_id => users, :controller => 'admin/users', :action => 'new')
    edit_user = Page.create!(:name => 'Edit', :proposed_parent_id => list_users, :controller => 'admin/users', :action => 'edit', :parameters => 'id')

    clients = Page.create!(:name => 'Clients', :proposed_parent_id => root, :controller => 'admin/clients', :action => 'index')
    list_clients = Page.create!(:name => 'List', :proposed_parent_id => clients, :controller => 'admin/clients', :action => 'index')
    edit_client = Page.create!(:name => 'Edit', :proposed_parent_id => clients, :controller => 'admin/clients', :action => 'edit', :parameters => 'id')

    candidates = Page.create!(:name => 'Candidates', :proposed_parent_id => root, :controller => 'admin/clients', :action => 'index')
    list_candidates = Page.create!(:name => 'List', :proposed_parent_id => candidates, :controller => 'admin/candidates', :action => 'index')
    edit_candidate = Page.create!(:name => 'Edit', :proposed_parent_id => candidates, :controller => 'admin/candidates', :action => 'edit', :parameters => 'id')

    pages = Page.create!(:name => 'Pages', :proposed_parent_id => root, :controller => 'admin/pages', :action => 'index')
    list_pages = Page.create!(:name => 'List', :proposed_parent_id => pages, :controller => 'admin/pages', :action => 'index')
    new_page = Page.create!(:name => 'New', :proposed_parent_id => pages, :controller => 'admin/pages', :action => 'new')

    vacancies = Page.create!(:name => 'Vacancies', :proposed_parent_id => root, :controller => 'admin/vacancies', :action => 'index')
    list_vacancies = Page.create!(:name => 'List', :proposed_parent_id => vacancies, :controller => 'admin/vacancies', :action => 'index')
    new_vacancy = Page.create!(:name => 'New', :proposed_parent_id => vacancies, :controller => 'admin/vacancies', :action => 'new')
    edit_vacancy = Page.create!(:name => 'Edit', :proposed_parent_id => list_vacancies, :controller => 'admin/vacancies', :action => 'edit', :parameters => 'id')

    documents = Page.create!(:name => 'Documents', :proposed_parent_id => root, :controller => 'admin/documents', :action => 'index')
    list_documents = Page.create!(:name => 'List', :proposed_parent_id => documents, :controller => 'admin/documents', :action => 'index')
    upload_documents = Page.create!(:name => 'Upload', :proposed_parent_id => documents, :controller => 'admin/documents', :action => 'new')
    edit_document = Page.create!(:name => 'Edit', :proposed_parent_id => list_documents, :controller => 'admin/documents', :action => 'edit', :parameters => 'id')
    show_document = Page.create!(:name => 'Show', :proposed_parent_id => list_documents, :controller => 'admin/documents', :action => 'show', :parameters => 'id')
  end


  private

  def proposed_root?
    proposed_parent_id.nil? || proposed_parent_id == ''
  end

  def move_to_correct_position
    unless proposed_parent_id.nil? || proposed_parent_id == ''
      parent = Page.find_by_id(proposed_parent_id)
      self.move_to_child_of(parent)
    end
  end
end
