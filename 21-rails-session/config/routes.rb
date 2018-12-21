Rails.application.routes.draw do
  # get '/nachos', to: 'nachos#index', as: 'nachos'
  # get '/nacho/:id', to: 'nachos#show', as: 'nacho'
  resources :nachos, only: [:index, :show]

  patch '/cart', to: "cart#update", as: :add_nacho_to_cart


end
