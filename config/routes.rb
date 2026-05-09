Rails.application.routes.draw do
  root "pages#home"

  resource :session, only: [:new, :create, :destroy]
  get "/login", to: "sessions#new", as: :login
  delete "/logout", to: "sessions#destroy", as: :logout

  resources :users, except: [:destroy]
  resources :posts
  resources :projects
  resources :policy_proposals
  resources :tags, only: [:index, :show]
  resources :reports, only: [:index, :show, :create, :update]
  resources :scheduled_posts
  resources :posting_queues
  resources :posting_queue_items

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
