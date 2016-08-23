Rails.application.routes.draw do
  resources :favorite_songs
  resources :favorite_albums
  resources :favorite_artists
  resources :favorites
  resources :songs
  resources :albums
  resources :artists
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
