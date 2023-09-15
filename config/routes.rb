Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show]
  resources :rooms, only: [:index, :show]
  resources :reservations, only: [:create, :destroy]

  root "rooms#index"
end
