Rails.application.routes.draw do
  root "posts#index"

  resources :posts
  resources :photos

  get 'biography', to: 'bios#index'
end
