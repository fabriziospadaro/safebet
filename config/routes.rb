Rails.application.routes.draw do
  resources :bets,  except:[:new]
  get "events", to: "events#index", as: :events
  get "sport", to: "sports#index", as: :sport
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
