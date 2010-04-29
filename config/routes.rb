ActionController::Routing::Routes.draw do |map|

  # front end
  map.home '/home', :controller => 'home', :action => 'index'

  map.connect 'vacancy/:id', :controller => 'vacancies', :action => 'apply',
              :conditions => { :method => :put }


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
  map.client_login '/client-login', :controller => 'client_sessions', :action => 'new'
  map.candidate_login '/candidate-login', :controller => 'candidate_sessions', :action => 'new'
  map.logout '/logout', :controller => 'user_sessions', :action => 'destroy'
  map.admin '/admin', :controller => 'admin'
  map.client_registration '/client_registration', :controller => 'clients', :action => 'new'
  map.candidate_registration '/candidate_registration', :controller => 'candidates', :action => 'new'
  map.staff_registration '/admin/staff_registration', :controller => 'admin/staffs', :action => 'new'

  map.root :home

  map.resources :users, :clients, :candidates, :vacancies, :password_resets
  map.resource :user_session, :client_session, :candidate_session

  map.namespace(:admin) do |admin|
    admin.resources :pages
    admin.resources :users
    admin.resources :clients
    admin.resources :candidates
    admin.resources :staffs
    admin.resources :vacancies, :collection => {:delete_multiple => :post, :archive_multiple => :post }
    admin.resources :categories
    admin.resources :documents
    admin.resources :applications
  end

  map.connect '*path', :controller => 'static'

end
