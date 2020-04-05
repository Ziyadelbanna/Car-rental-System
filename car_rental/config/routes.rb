Rails.application.routes.draw do
  root 'welcome#home'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


  resources :reviews
  resources :rentals
  resources :favourites
  resources :cars
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
