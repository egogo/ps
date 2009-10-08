ActionController::Routing::Routes.draw do |map|
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  
  map.resource :session
  
  map.namespace :admin do |admin|
    admin.resources :galleries
    admin.resources :users
    admin.resources :static_pages
    admin.resources :content_blocks
    admin.root :controller => 'galleries'
  end
  
  map.page '/static/:permalink', :controller => 'static_pages', :action => 'show', :path_prefix => ':lang'
  map.gallery '/:permalink', :controller => 'galleries', :action => 'show', :path_prefix => ':lang'
  map.root :controller => 'galleries', :path_prefix => ':lang'
  map.connect '', :controller => 'galleries', :action => 'index'

end