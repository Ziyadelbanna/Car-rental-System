Rails.application.routes.draw do
  root 'welcome#home'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


  get 'saved', to: 'users#my_saved'
  post 'save_car', to: 'users#add_cars_to_favourite'

  resources :reviews
  resources :rentals
  resources :favourites
  resources :cars
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
