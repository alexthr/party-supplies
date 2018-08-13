Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/create'
  get 'offers/index'
  get 'offers/show'
  get 'offers/new'
  get 'offers/create'
  get 'offers/edit'
  get 'offers/update'
  get 'offers/destroy'
  root to: 'offers#index'
  resources :offers do
    resources :bookings, only: [:index, :new, :create]
  end
end
