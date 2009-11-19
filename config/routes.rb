ActionController::Routing::Routes.draw do |map|
  map.login '/login', :controller => 'user_sessions', :action => 'new'
  map.logout '/logout', :controller => 'user_sessions', :action => 'destroy'
  map.admin '/admin', :controller => 'admin'
  map.client_registration '/client_registration', :controller => 'clients', :action => 'new'

  map.resources :users, :clients
  map.resource :user_session

  map.namespace(:admin) do |admin|
    admin.resources :pages
    admin.resources :users
    admin.resources :vacancies
  end

end
