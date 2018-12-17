Rails.application.routes.draw do
  resources :decks
  resources :players # 7!
  # index, show, new, create, edit, update, delete/destroy

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
