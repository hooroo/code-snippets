Rails.application.routes.draw do
  resources :users, only: [:create, :edit, :new, :show, :update]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  root to: "sessions#new"
end
