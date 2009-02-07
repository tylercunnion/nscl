ActionController::Routing::Routes.draw do |map|
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.resources :users

  map.resource :session
  
  map.resources :publications, :controller => 'admin/publications', :path_prefix => "admin"
  map.resources :members, :controller => 'admin/members', :path_prefix => "admin"
  map.resources :schools, :controller => 'admin/schools', :path_prefix => "admin"
  map.resources :links, :controller => 'admin/links', :path_prefix => "admin"
  map.resources :officers, :controller => 'admin/officers', :path_prefix => "admin"

  # The priority is based upon order of creation: first created -> highest priority.
  
  # Sample of regular route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  # map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # You can have the root of your site routed by hooking up '' 
  # -- just remember to delete public/index.html.
  map.connect '', :controller => "about", :action => "index"
  map.connect 'business', :controller => "business/officers", :action => "index"
  map.connect 'members', :controller => "members/scholarships", :action => "index"
  map.connect 'admin', :controller => "admin", :action => "index"
  map.denied 'admin/denied', :controller => "admin", :action => "denied"

  map.connect 'members/services/browse/:browse_method', :controller => "members/services", :action => "browse"
  map.connect 'business/officers/:link/:action', :controller => "business/officers"

  map.connect 'publications/:action', :controller => "publications"
  map.connect 'members/scholarships/:action', :controller => "members/scholarships"
  map.connect 'members/services/:action', :controller => "members/services"
  map.connect 'links/:action', :controller => "links"

#  map.connect ':controller/:link/:action'
  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'
end
