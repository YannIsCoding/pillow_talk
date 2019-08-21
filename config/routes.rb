Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :pillows, only: [:index, :new, :show, :create, :update, :edit, :destroy]


  resources :bookings, only: [:index, :show, :update, :edit, :destroy] do
    resources :reviews, only: [:new, :create, :destroy]
  end


  resources :pillows do
    resources :bookings, only: [:new, :create]
  end
end
