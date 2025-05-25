Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Auth routes
  get '/auth/auth0/callback', to: 'auth#callback'
  get '/auth/failure', to: 'auth#failure'
  get '/login', to: 'auth#login'
  
  # Dashboard route
  get '/dashboard', to: 'dashboard#index'
  
  # Inventory Items routes
  resources :inventory_items, only: [:index, :new, :create, :edit, :update] do
    member do
      post :remove
    end
  end
  
  # Root route - redirects to login if not authenticated
  root 'auth#login'
end
