Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :gardens do
    resources :bookings, only: [:show, :new, :create, :edit, :update]
  end

  resources :bookings, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
