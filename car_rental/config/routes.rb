Rails.application.routes.draw do
  resources :reviews
  resources :rentals
  resources :favourites
  resources :cars
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => 'cars#index'
  get 'go.html' => 'sessions#login'
  get 'register' => 'users#index'
  post 'insert' => 'users#create'
  post 'session' => 'sessions#create'

end


