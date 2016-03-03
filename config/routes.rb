Rails.application.routes.draw do
  get "/products", to: "pages#products"
  get "/home", to: "pages#home"
  get "/distributors", to: "pages#distributors"
  get "/fitment", to: "pages#fitment"
  get "/racing_team", to: "pages#racing_team"
  get "/contact", to: "pages#contact"
  root 'pages#home'
end
