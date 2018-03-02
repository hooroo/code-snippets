Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
end
