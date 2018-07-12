Rails.application.routes.draw do

  get 'current_parlays/show'
  get "edit_bet", to: "bets#update_bet", as: :post_bet
  get "events", to: "events#index", as: :events
  get "sport", to: "sports#index", as: :sport
  get "slip", to: "current_parlays#show", as: :slip
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
