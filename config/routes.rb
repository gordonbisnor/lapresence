Lapresence::Application.routes.draw do
  
  devise_for :users
  resources :groupes
  resources :ateliers
  resources :images
  resources :events
  
  get "admin" => "admin/dashboard#index", as:  :admin_dashboard 
    
  get 'ateliers/:id' => 'ateliers#show'
  get 'groupes/:id' => 'groupes#show'
  get ':id' => 'pages#show'
  
  get "/pages/bio.html"             => "redirects#bio"  
  get "/pages/approche.html"        => "redirects#approche"
  get "/pages/livre.html"           => "redirects#bibliographie"
  get "/pages/ateliers.html"        => "redirects#ateliers"
  get "/pages/groupes.html"         => "redirects#groupes"
  get "/pages/extrait_impr.html"    => "redirects#extrait_impr"
  get "/pages/contact.html"         => "redirects#coordonnees"
  get "/pages/consultations.html"   => "redirects#formation"
  get "/pages/extrait_livre.html"   => "redirects#extrait_du_livre"
  
  get  "/bibliographie"     => "pages#show",    id: "bibliographie",     as:  :bibliographie 
  get  "/bio"               => "pages#show",    :id  => "bio",              as:  :bio
  get  "/approche"          => "pages#show",    id: "approche",          as:  :approche
  get  "/formation"         => "pages#show",    id: "formation",         as:  :formation
  get  "/coordonnees"       => "pages#show",    id: "coordonnees",       as:  :coordonnees
  get  "/extrait_du_livre"  => "pages#show",    id: "extrait_du_livre",  as:  :extrait_du_livre

  get  "/extrait_impr"      => "pages#extrait_impr", as:  :extrait_impr
 
  namespace :admin do
    resources :dashboard, :only => "index"
    resources :pages
    resources :attachments
    resources :ateliers do
       collection do
         match "sort", via: [:get,:post,:put]
        end
      end
    resources :groupes do
      collection do
        match "sort", via: [:get,:post,:put]
      end
    end
  end

  post "admin/versions/:id/revert" => "admin/versions#revert", as: "admin_revert_version"


 root :to => 'pages#index'
   
end
