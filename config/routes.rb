Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :gardens do
    resources :bookings, only: [:new, :create]
    collection do
      get :mygardens
    end
  end

  resources :bookings, only: [:show, :update, :destroy] do
    collection do
      get :mybookings
    end
    resources :reviews, only: [:new, :create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
