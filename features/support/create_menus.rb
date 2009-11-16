Page.delete_all
root = Page.create!(:name => 'Root')
#account = Page.create!(:name => 'Account', :proposed_parent_id => root, :controller => 'users', :action => 'show', :parameters => 'current_user')
users = Page.create!(:name => 'Users', :proposed_parent_id => root, :controller => 'admin/users', :action => 'index')
list_users = Page.create!(:name => 'List', :proposed_parent_id => users, :controller => 'admin/users', :action => 'index')
new_user = Page.create!(:name => 'New', :proposed_parent_id => users, :controller => 'admin/users', :action => 'new')
pages = Page.create!(:name => 'Pages', :proposed_parent_id => root, :controller => 'admin/pages', :action => 'index')
list_pages = Page.create!(:name => 'List', :proposed_parent_id => pages, :controller => 'admin/pages', :action => 'index')
new_page = Page.create!(:name => 'New', :proposed_parent_id => pages, :controller => 'admin/pages', :action => 'new')
