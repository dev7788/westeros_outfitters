Rails.application.routes.draw do

  resources :users, only: [:new,:create,:show]

  resources :categories, :path => "/", :only => [:index, :show] do
      resources :items, :path => "/", :only => [:index, :show, :new] do
    end
end

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: 'sessions#destroy'

end
