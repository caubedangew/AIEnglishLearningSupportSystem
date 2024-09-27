Rails.application.routes.draw do
  root :to => "courses#index"

  # Course route
  resources :courses

  # Lesson route
  resources :lessons

  # Exercise route
  resources :exercises

  # Result route
  resources :results, only: [:index, :show]

  # Result details
  resources :results, only: [:edit, :update]

  # Question route
  resources :questions, only: [:new, :create, :show, :edit, :update, :destroy]

  # Answer route
  resources :answers, only: [:new, :create, :edit, :update, :destroy]


  # API route for all tables
  namespace :api do
    resources :courses, only: [:index]
    resources :lessons, only: [:index]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

end