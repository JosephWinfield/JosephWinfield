Rails.application.routes.draw do
  root 'posts#index'

  resources :posts
  resources :photos
  resources :bios
end
