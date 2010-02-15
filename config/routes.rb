ActionController::Routing::Routes.draw do |map|

  # front end
  map.home '/home', :controller => 'home', :action => 'index'

  map.with_options :controller => 'contact' do |contact|
    contact.contact '/contact',
    :action => 'index',
    :conditions => { :method => :get }

    contact.contact '/contact',
    :action => 'create',
    :conditions => { :method => :post }
  end


 # map.unauthorised_access '/unauthorised', :controller => 'static', :action => 'unauthorised'
  map.login '/login', :controller => 'user_sessions', :action => 'new'
  map.client_login '/client-login', :controller => 'user_sessions', :action => 'new', :user_type => 'client'
  map.candidate_login '/candidate-login', :controller => 'user_sessions', :action => 'new', :user_type => 'candidate'
  map.logout '/logout', :controller => 'user_sessions', :action => 'destroy'
  map.admin '/admin', :controller => 'admin'
  map.client_registration '/client_registration', :controller => 'clients', :action => 'new'
  map.candidate_registration '/candidate_registration', :controller => 'candidates', :action => 'new'
  map.staff_registration '/admin/staff_registration', :controller => 'admin/staffs', :action => 'new'

  map.root :home

  map.resources :users, :clients, :candidates, :vacancies
  map.resource :user_session

  map.namespace(:admin) do |admin|
    admin.resources :pages
    admin.resources :users
    admin.resources :clients
    admin.resources :candidates
    admin.resources :staffs
    admin.resources :vacancies
    admin.resources :categories
    admin.resources :documents
  end

  map.connect '*path', :controller => 'static'

end
