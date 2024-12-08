Rails.application.routes.draw do
  get 'profile', to: 'profile#index', as: 'profile'

# Route for updating the profile (PATCH request)
  patch 'profile', to: 'profile#update', as: 'update_profile'
  get "home/index"

  post "/login", to: "login#login", as: "login_login"
  post "/signup", to: "login#signup"

  get "/login", to: "login#index", as: "login"
  post "login/create", to: "login#create", as: "login_create"

  delete "logout", to: "login#destroy", as: "logout"

  resources :posts do
    resources :comments
  end
  resources :saved_events,  param: :event_id, only: [ :create, :destroy ]
  resources :messages

  resources :events do
    resources :comments
    resources :rsvps
    resources :invites
  end

  get "home/index"
  root "home#index"  # This sets the root route to the 'index' action in 'HomeController'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
