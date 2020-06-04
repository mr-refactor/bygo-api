Rails.application.routes.draw do
  resources :lists
  resources :users
  
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get "welcome/index"

  root "welcome#index"
end
