Ranguru::Application.routes.draw do
  get 'welcome/index'
  post 'welcome/index'
  get 'restaurants/modal'
  get 'restaurants/index'
  get 'restaurants/rated'
  get 'restaurants/rate'
  get 'users/modal'
  get 'users/add_friend'
  get 'users/return_to_origin'

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
  resources :restaurants

  match '/signup',  to: 'users#new',        via: 'get'
  match '/signin',  to: 'sessions#new',     via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/restaurants/rate', to: 'restaurants#rate', via: 'post'
  match '/restaurants/rate', to: 'restaurants#rate', via: 'get'
  match '/welcome/recommender', to: 'welcome#recommender', via: 'post'
  match '/welcome/recommender', to: 'welcome#recommender', via: 'get'
  match '/welcome/finalize', to: 'welcome#finalize', via: 'post'
  match '/welcome/finalize', to: 'welcome#finalize', via: 'get'
  match '/welcome/add_friends', to: 'welcome#add_friends', via: 'post'
  match '/welcome/add_friends', to: 'welcome#add_friends', via: 'get'
  match '/welcome/reset', to: 'welcome#reset', via: 'get'
  match '/users/add_friend', to: 'users#add_friend', via: 'post'
  match '/users/add_friend', to: 'users#add_friend', via: 'get'
  match '/users/return_to_origin', to: 'users#return_to_origin', via: 'get'

end
