Rails.application.routes.draw do
  get 'auth/:provider/callback', to: "sessions#create"
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resources :welcome, only: [:show]

  root "welcome#show"
  get '/search', to: "search#show" 
  get '/results', to: 'results#index'

  namespace :api do
    namespace :v1 do
      resources :programs, only: [:show, :index]
    end
  end
  resources :users, only: [:show]

  namespace :api do
    namespace :v1 do
      resources :saves, only: [:create]
    end
  end
end  

