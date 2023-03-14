Rails.application.routes.draw do
  resources :auctions do
    member do
      get "bids"
      post "bids", to: "auctions#create_bid"
    end
  end
  resources :users
  post "auth/login", to: "authentication#login"
end
