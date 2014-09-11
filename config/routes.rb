Lapresence::Application.routes.draw do
  
  resources :groupes
  resources :ateliers
  resources :images
  resources :events
  
  match "admin" => "admin/dashboard#index", :as => :admin_dashboard 
    
  match 'ateliers/:id' => 'ateliers#show'
  match 'groupes/:id' => 'groupes#show'
  match ':id' => 'pages#show'
  
  match "/pages/bio.html"             => "redirects#bio"  
  match "/pages/approche.html"        => "redirects#approche"
  match "/pages/livre.html"           => "redirects#bibliographie"
  match "/pages/ateliers.html"        => "redirects#ateliers"
  match "/pages/groupes.html"         => "redirects#groupes"
  match "/pages/extrait_impr.html"    => "redirects#extrait_impr"
  match "/pages/contact.html"         => "redirects#coordonnees"
  match "/pages/consultations.html"   => "redirects#formation"
  match "/pages/extrait_livre.html"   => "redirects#extrait_du_livre"
  
  match  "/bibliographie"     => "pages#show",    :id => "bibliographie",     :as => :bibliographie 
  match  "/bio"               => "pages#show",    :id  => "bio",              :as => :bio
  match  "/approche"          => "pages#show",    :id => "approche",          :as => :approche
  match  "/formation"         => "pages#show",    :id => "formation",         :as => :formation
  match  "/coordonnees"       => "pages#show",    :id => "coordonnees",       :as => :coordonnees
  match  "/extrait_du_livre"  => "pages#show",    :id => "extrait_du_livre",  :as => :extrait_du_livre

  match  "/extrait_impr"      => "pages#extrait_impr", :as => :extrait_impr
 
  namespace :admin do
    resources :dashboard, :only => "index"
    resources :pages
    resources :attachments
    resources :ateliers do
       collection do
         match "sort"
        end
      end
    resources :groupes do
      collection do
        match "sort"
      end
    end
  end

 root :to => 'pages#index'
   
end
