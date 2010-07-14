ActionController::Routing::Routes.draw do |map|

  #map.resources :users
  map.resource :session

  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  #map.register '/register', :controller => 'users', :action => 'create'
  #map.signup '/signup', :controller => 'users', :action => 'new'

  
  map.resources :publications, :controller => 'admin/publications', :path_prefix => "admin"
  map.resources :members, :controller => 'admin/members', :path_prefix => "admin", :collection => {:auto_complete_for_member_name => :post, :auto_complete_for_member_register => :post, :register => :put, :registration => :get, :get_spreadsheet => :get}
  map.resources :schools, :controller => 'admin/schools', :path_prefix => "admin"
  map.resources :links, :controller => 'admin/links', :path_prefix => "admin"
  map.resources :officers, :controller => 'admin/officers', :path_prefix => "admin"


  map.connect 'admin/:action', :controller => "admin"
  map.denied 'admin/denied', :controller => "admin", :action => "denied"
  
  
  map.root                  :controller => "about", :action => "index"
  map.sitemap               'sitemap.xml', :controller => "sitemap", :action => "index", :format => "xml"
  map.business_section      'business/officers', :controller => "business/officers", :action => "index"
  map.events_section        'events/:action', :controller => "events"
  map.members_section       'members', :controller => "members/scholarships", :action => "index"
  map.publications_section  'publications/:action', :controller => "publications"
  map.about_section         'about/:action', :controller => "about"
  

  map.browse  'members/services/browse', :controller => "members/services", :action => "browse"
  map.connect 'business/officers/:link/:action', :controller => "business/officers"
  map.connect 'business/documents/:action', :controller => "business/documents"
  map.connect 'members/scholarships/:action', :controller => "members/scholarships"
  map.connect 'members/services/:action', :controller => "members/services"


  #map.connect ':controller/:action/:id.:format'
  #map.connect ':controller/:action/:id'
end
