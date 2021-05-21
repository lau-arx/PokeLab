Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  get 'random_shot', to:'pages#random_shot'
  get 'know_more', to: 'pages#know_more'
  get 'heavy_stuffs', to: 'pages#heavy_stuffs'
  get 'true_freedom', to: 'pages#true_freedom'
  get 'hazardous_places', to: 'pages#hazardous_places'
  get 'cozy_day', to: 'pages#cozy_day'

  resources :pokemons do
    resources :bookings, only: [ :new, :create, :index, :edit, :update]
  end

  resources :bookings, only: :destroy

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
