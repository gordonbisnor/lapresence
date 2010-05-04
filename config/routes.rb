ActionController::Routing::Routes.draw do |map|
  
  map.connect "admin", :controller => "admin/pages"
  
  map.connect "/pages/bio.html" ,:controller => "redirects", :action => "bio"
  map.bio "/bio", :controller => "pages", :action => "show", :id => "bio"
  
  map.connect "/pages/approche.html" ,:controller => "redirects", :action => "approche"
  map.approche "/approche", :controller => "pages", :action => "show", :id => "approche"
  
  map.connect "/pages/livre.html" ,:controller => "redirects", :action => "bibliographie"
  map.bibliographie "/bibliographie", :controller => "pages", :action => "show", :id => "bibliographie"
  
  map.connect "/pages/ateliers.html" ,:controller => "redirects", :action => "ateliers"
  map.ateliers "/ateliers", :controller => "pages", :action => "show", :id => "ateliers"
  
  map.connect "/pages/groupes.html" ,:controller => "redirects", :action => "groupes"
  map.groupes "/groupes", :controller => "pages", :action => "groupes"
  
  map.connect "/pages/consultations.html" ,:controller => "redirects", :action => "consultations"
  map.consultations "/consultations", :controller => "pages", :action => "show", :id => "consultations"  
  
  map.connect "/pages/contact.html" ,:controller => "redirects", :action => "coordonnees"
  map.coordonnees "/coordonnees", :controller => "pages", :action => "show", :id => "coordonnees"
  
  
  map.connect "/pages/extrait_impre.html" ,:controller => "redirects", :action => "extrait_du_livre"
  map.extrait_du_livre "/extrait_du_livre", :controller => "pages", :action => "extrait_du_livre"
  
  map.namespace :admin do |admin|
    admin.resources :pages
  end
  
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
   map.root :controller => "pages"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  map.connect ':id', :controller => "pages", :action => "show"
    
end
