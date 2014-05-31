Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  resources :links, only: [:new, :create]
  resources :posts, only: [:new, :create]
end
