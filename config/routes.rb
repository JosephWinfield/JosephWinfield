Rails.application.routes.draw do
  devise_for :users
  root "bios#index"

  resources :posts
  resources :photos

  namespace :admin do
    resources :users, only: [:index, :destroy]
  end

  get 'biography', to: 'bios#index'
end
