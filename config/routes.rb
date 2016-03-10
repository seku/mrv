Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get "/products", to: "pages#products"
  get "/home", to: "pages#home"
  get "/distributors", to: "pages#distributors"
  get "/fitment", to: "pages#fitment"
  get "/racing_team", to: "pages#racing_team"
  root 'pages#home'
end
