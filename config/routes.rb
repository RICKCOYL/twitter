Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :posts
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'sessions/new'
  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
  post 'login', to: 'sessions#create'
  root to: 'sessions#new'
end
