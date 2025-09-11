Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  resources :scores, only: [:index]

  resources :users do
    resources :scores, only: [:index]
  end

  resources :games do
    resources :scores, only: %i[index new create show]
  end
end
