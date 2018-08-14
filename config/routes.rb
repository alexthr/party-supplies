Rails.application.routes.draw do
  get 'users/show'

  devise_for :users

  root to: 'offers#index'

  resources :offers do
    resources :bookings, only: [:index, :new, :create]
  end

  resources :users, only: :show

  namespace :my do
    resources :offers, only: :index
    resources :bookings, only: :index
  end
end
