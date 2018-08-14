Rails.application.routes.draw do
  devise_for :users
  root to: 'offers#index'
  resources :offers do
    resources :bookings, only: [:index, :new, :create]
  end
end
