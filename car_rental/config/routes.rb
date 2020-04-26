Rails.application.routes.draw do

  resources :rented_cars
  root 'welcome#home'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


  get 'saved', to: 'users#my_saved'
  post 'save_car', to: 'users#add_cars_to_favourite'

  get 'search', to: 'cars#search'


  get 'rented', to: 'users#my_rented'
  post 'rent_car', to: 'users#add_cars_to_rent'

  resources :reviews
  resources :cars
  resources :users
  resources :saved_cars
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
