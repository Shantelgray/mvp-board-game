Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  resources :games
  resources :scores
  resources :users
end
