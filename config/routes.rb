Rails.application.routes.draw do
  resources :users, only: [:show, :new, :create, :edit, :update]
  resources :attractions, only: [:show, :new, :create, :edit, :update]
  root 'sessions#index'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  # get '/login' => 'sessions#new'
  # post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/attractions' => 'attractions#index'
  get '/attractions/new' => 'attractions#new'
  post '/attractions/new' => 'attractions#create'
  get '/attractions/edit' => 'attractions#edit'
  get '/users/:id' => 'users#show'


  # resources :rides, only: [:show, :new, :create, :edit, :update]

  #
  # root 'welcome#home'

end
