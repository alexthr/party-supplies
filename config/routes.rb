Rails.application.routes.draw do
  get 'users/show'

  devise_for :users

  as :user do
    get 'users', to: 'users#show', as: :user_root
  end

  root to: 'offers#index'

  resources :offers do
    resources :bookings, only: [:index, :new, :create]
  end

  resources :users, only: [:show, :edit, :update]

  namespace :my do
    resources :offers, only: :index
    resources :bookings, only: :index
  end

  get '/search', to: 'search#search'
end
