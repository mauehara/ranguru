Ranguru::Application.routes.draw do
  get 'welcome/index'
  get 'welcome/recommender'

  root 'welcome#index'

  if Rails.env.production?
    offline = Rack::Offline.configure :cache_interval => 120 do      
      cache ActionController::Base.helpers.asset_path("application.css")
      cache ActionController::Base.helpers.asset_path("application.js")
      # cache other assets
      network "/"  
    end
    get "/application.manifest" => offline  
  end

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  match '/signup',  to: 'users#new',        via: 'get'
  match '/signin',  to: 'sessions#new',     via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/rate'   , to: 'restaurant#rate',  via: 'get'

end
