ActionController::Routing::Routes.draw do |map|

 # map.unauthorised_access '/unauthorised', :controller => 'static', :action => 'unauthorised'
  map.login '/login', :controller => 'user_sessions', :action => 'new'
  map.logout '/logout', :controller => 'user_sessions', :action => 'destroy'
  map.admin '/admin', :controller => 'admin'
  map.client_registration '/client_registration', :controller => 'clients', :action => 'new'
  map.candidate_registration '/candidate_registration', :controller => 'candidates', :action => 'new'
  map.staff_registration '/admin/staff_registration', :controller => 'admin/staffs', :action => 'new'

  map.root :login

  map.resources :users, :clients, :candidates
  map.resource :user_session

  map.namespace(:admin) do |admin|
    admin.resources :pages
    admin.resources :users
    admin.resources :clients
    admin.resources :candidates
    admin.resources :staffs
    admin.resources :vacancies
    admin.resources :documents
  end

  map.connect '*path', :controller => 'static'

end
