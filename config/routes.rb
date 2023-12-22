Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"

  resources :tweets, only: :create do
    resources :likes, only: [:create, :destroy]
    resources :bookmarks, only: [:create, :destroy]
  end
  resources :usernames, only: [:new, :update]
  get :dashboard, to: "dashboard#index"

  resources :likes, only: [:create, :destroy]
end
