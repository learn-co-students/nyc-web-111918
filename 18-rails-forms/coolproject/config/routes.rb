Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/airplanes/new', to:"airplanes#new", as:"helper"
  resources :airplanes, except: :show
  get '/airplanes/:id', to:"airplanes#show", as:"showmetheshowpage"
  # post '/airplanes', to:"airplanes#create"
  # get '/airplanes/:id/edit', to:"airplanes#edit"
  # patch '/airplanes/:id', to:"airplanes#update"
  # delete '/airplanes/:id', to:"airplanes#delete"

end
