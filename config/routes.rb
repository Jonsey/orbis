ActionController::Routing::Routes.draw do |map|
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login '/login', :controller => 'user_sessions', :action => 'new'
  map.admin '/admin', :controller => 'admin'

  map.resource :account, :controller => 'users'
  map.resources :users
  map.resource :user_session

  map.namespace(:admin) do |admin|
    admin.resources :users
  end

end
