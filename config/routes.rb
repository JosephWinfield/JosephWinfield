Rails.application.routes.draw do
  devise_for :users
  root "bios#index"

  resources :posts
  resources :photos

  namespace :admin do
    resources :users, only: [:index, :destroy]
    resources :photos, only: [:index, :destroy, :delete]
  end

  get 'biography', to: 'bios#index'
end
