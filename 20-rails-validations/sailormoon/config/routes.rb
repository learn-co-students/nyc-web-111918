Rails.application.routes.draw do
  resources :scouts, except: :index
  get '/scouts', to:"scouts#powerscouts", as:"alldemscourtsdoeBOII"
  # get '/scouts/purple/:id', to:"scouts#colored_color"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
