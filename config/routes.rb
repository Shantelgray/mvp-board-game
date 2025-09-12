Rails.application.routes.draw do
  root "home#index"

  resources :scores, only: [:index]

  devise_for :users
  resources :users, only: %i[index show edit update] do
    resources :scores, only: [:index]
  end

  resources :games do
    resources :scores, only: %i[index new create show]
  end
end
