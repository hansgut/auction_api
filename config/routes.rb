Rails.application.routes.draw do
  resources :auctions
  resources :users
  post "auth/login", to: "authentication#login"
end
