Rails.application.routes.draw do
  get "/clients/:status", to: "clients#index"
  resources :clients
  # resources :users
  # get "login" => "users#login"

  

  # get "/login1" => "users#login1"

  # get "/index" => "users#index"
end
