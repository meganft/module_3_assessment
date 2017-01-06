Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :items
    end
  end

  post '/search', to: "best_buy#index", as: "search"
  get '/stores/:id', to: "best_buy#show", as: "store"
end
