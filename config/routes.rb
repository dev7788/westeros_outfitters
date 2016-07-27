Rails.application.routes.draw do

  resources :users, only: [:new,:create,:show]
  resources :items
  # resources :item_carts, except: [:index]


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post '/item_carts', to: 'item_carts#create'
  get '/item_carts', to: 'item_carts#show'

  
  get "/:name" => "categories#show", as: "category"
end
