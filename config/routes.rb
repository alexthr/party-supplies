Rails.application.routes.draw do
  root to: 'offers#index'
  resources :offers do
    resources :bookings, only: [:index, :new, :create]
  end
end
