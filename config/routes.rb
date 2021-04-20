Rails.application.routes.draw do
  # get 'comments/new'
  # get 'cards/new'
  # get 'users/show'
  get 'groups/index'
  get 'items/search_rk'
  devise_for :users
  resources :users do
    resources :cards
  end
  root to: 'items#index'
  resources :items do
    resources :orders, only: [:index, :create]
    resources :messages
    resources :comments
    collection do
      get 'search'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
