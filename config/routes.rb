Rails.application.routes.draw do
  get 'bets/new'
  get 'bets/create'
  get 'bets/update'
  get 'bets/edit'
  get 'bets/destroy'
  get "events", to: "events#index", as: :events
  get "sport", to: "sports#index", as: :sport
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
