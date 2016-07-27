Rails.application.routes.draw do

  resources :users, only: [:new,:create,:show]
  resources :items

  get '/:name', to: 'categories#show', as: :category
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
