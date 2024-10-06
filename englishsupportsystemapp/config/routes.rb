Rails.application.routes.draw do
  root :to => "home#index"

  # Course route
  resources :courses

  # Lesson route
  resources :lessons

  # Exercise route
  resources :exercises do
    resources :questions, only: [:index, :new, :create, :edit, :update, :destroy] do
      resources :answers, only: [:index, :new, :create, :edit, :update, :destroy]
    end
  end

  # Result route nested result details route
  resources :results, only: [:index, :show] do
    resources :result_details, only: [:edit, :update]
  end

  # Login route
  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"

  # API route for all tables
  namespace :api do
    # API for course
    resources :courses, only: [:index]
    # API for lessons
    resources :lessons, only: [:index]
    # API for users
    post "/users/login", "users#login"
    post "/users/register", "users#register"
    get "/users/current_user", "users#current_user"
    post "/users/update", "users#update"
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

end
