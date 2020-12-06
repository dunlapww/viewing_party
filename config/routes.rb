Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  #users
  get '/registration', to: 'users#new', as: 'users'
  post '/registration', to: 'users#create'
  get '/dashboard', to: 'users#show'
  post '/dashboard', to: 'users#addfriend'

  #sessions
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  #movies
  get '/movies/:uuid', to: 'movie_services#show'

  #viewing_parties
  get '/movies/:uuid/viewing-party/new', to: 'viewing_parties#new'
  post '/movies/:uuid/viewing-party', to: 'viewing_parties#create', as: 'create_vp'
end
