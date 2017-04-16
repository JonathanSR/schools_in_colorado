Rails.application.routes.draw do
  root "welcome#show"
  get '/search', to: "search#index" 
end
