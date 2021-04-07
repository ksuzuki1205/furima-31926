Rails.application.routes.draw do
  get 'cards/new'
  get 'users/show'
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :cards, only: [:new, :create]
  root to: 'items#index'
  resources :items do
    resources :orders, only: [:index, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
