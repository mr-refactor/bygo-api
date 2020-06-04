Rails.application.routes.draw do
  resources :lists
  
  resources :users
  get '/users/:id/lists', to: 'users#list_index'
  
  #sessions
  get '/sessions', to: 'sessions#index'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get "welcome/index"

  root "welcome#index"
end
