Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :users
  root to: 'posts#index'
  get 'signup', to: 'users#new', as: 'signup'
end
