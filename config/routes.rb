Rails.application.routes.draw do
  resource :user, only: [:create, :edit, :new, :show, :update]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  root to: "sessions#new"
end
