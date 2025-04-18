Rails.application.routes.draw do
  get "timelines/index"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "home#index"

  resources :motivations, only: ["new","create"]
  get "graph" => "motivations#graph"

  # config/routes.rb
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  get "settings", to: "settings#index"
  patch "settings", to: "settings#update"
  
end
