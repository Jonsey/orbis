ActionController::Routing::Routes.draw do |map|
  map.signup '/signup', :controller => 'users', :action => 'new'

  map.resources :users
end
