Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :users

  resources :games do
  resources :scores, only: [:index, :new, :create, :show]
  end
end
