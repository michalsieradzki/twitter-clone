Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"

  resources :tweets
  resources :usernames, only: [:new, :update]
  get :dashboard, to: "dashboard#index"
end
