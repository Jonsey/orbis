ActionController::Routing::Routes.draw do |map|
  map.login '/login', :controller => 'user_sessions', :action => 'new'
  map.logout '/logout', :controller => 'user_sessions', :action => 'destroy'
  map.admin '/admin', :controller => 'admin'

  map.resources :users
  map.resource :user_session

  map.namespace(:admin) do |admin|
    admin.resources :pages
    admin.resources :users
  end

end
