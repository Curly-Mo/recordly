Rails.application.routes.draw do
  resources :songs
  resources :albums
  resources :artists
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
