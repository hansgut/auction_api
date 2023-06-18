Rails.application.routes.draw do
  resources :auctions do
    member do
      get "bids"
      post "bids", to: "auctions#create_bid"
    end
  end
  resources :users
  post "auth/login", to: "authentication#login"
  get "current_user_auctions", to: "auctions#current_user_auctions"
  get "current_user", to: "users#get_current_user"
end
