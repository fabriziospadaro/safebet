Rails.application.routes.draw do

  get 'parlays/index'
  get 'parlays/show/:id', to: "parlays#show", as: :parlays_show
  get 'payouts/index'
  get 'payouts/show'
  get "edit_bet", to: "bets#update_bet", as: :post_bet
  get "events", to: "events#index", as: :events
  get "sport", to: "sports#index", as: :sport
    get "test", to: "pages#test", as: :test

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
