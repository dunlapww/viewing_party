Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :welcome, :path => '/', only: :index

  scope controller: :users do
    get '/registration' => :new, as: 'users'
    post '/registration' => :create
    get '/dashboard' => :show
    post '/dashboard' => :addfriend
  end

  scope controller: :sessions do
    get '/login' => :new
    post '/login' => :create
    delete '/logout' => :destroy
  end

  scope controller: :movie_services do
    get '/movies/:uuid' => :show, as: 'movie'
  end

  scope controller: :viewing_parties do
    get '/movies/:uuid/viewing-party/new' => :new, as: 'new_vp'
    post '/movies/:uuid/viewing-party' => :create, as: 'create_vp'
  end

  scope controller: :search do
    get '/discover' => :new
    get '/results/' => :show
  end
end
