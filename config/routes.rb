Rails.application.routes.draw do
  root to: 'homes#show'

  resources :users, only: [:new,:create]
  resources :items
  resources :orders, except: [:new]

  get '/dashboard' => "users#show", as: "user"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post '/cart', to: 'item_carts#create'
  get '/cart', to: 'item_carts#show'
  put '/cart/dec', to: 'item_carts#decrement', as: 'decrement'
  put '/cart/inc', to: 'item_carts#increment', as: 'increment'

  get "/:name" => "categories#show", as: "category"
end
