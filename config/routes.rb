Lapresence::Application.routes.draw do

  mount Shrine.presign_endpoint(:cache) => "/s3/params" # GET /s3/params 
  mount Shrine.uppy_s3_multipart(:cache) => "/s3/multipart"

  devise_for :users
  resources :groupes
  resources :ateliers
  resources :images
  resources :events
  
  get "admin" => "admin/dashboard#index", as:  :admin_dashboard 
    
  get ':id' => 'pages#show', as: :page
  
  get "/pages/bio.html"             => "redirects#bio"  
  get "/pages/approche.html"        => "redirects#approche"
  get "/pages/livre.html"           => "redirects#bibliographie"
  get "/pages/ateliers.html"        => "redirects#ateliers"
  get "/pages/groupes.html"         => "redirects#groupes"
  get "/pages/extrait_impr.html"    => "redirects#extrait_impr"
  get "/pages/contact.html"         => "redirects#coordonnees"
  get "/pages/consultations.html"   => "redirects#formation"
  get "/pages/extrait_livre.html"   => "redirects#extrait_du_livre"
  
  

  get  "/bio"               => "pages#show",    id: "bio",               as:  :bio

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
