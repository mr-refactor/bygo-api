Rails.application.routes.draw do
  resources :lists
  resources :users
  get "welcome/index"

  root "welcome#index"
end
