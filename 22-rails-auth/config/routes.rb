Rails.application.routes.draw do
  resources :users, only: [:show, :new, :create, :destroy]

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy', as: 'logout'
end
