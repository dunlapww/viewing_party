Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  #users
  get '/registration', to: 'users#new', as: 'users'
  post '/registration', to: 'users#create'
  get '/dashboard', to: 'users#show'

  #sessions
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  #movies
  get '/movies/:uuid', to: 'movie_services#show'
end
