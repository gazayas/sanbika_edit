Rails.application.routes.draw do

  root :to => 'users#index'

  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users do
    resources :songs #do
      #resources :likes
    #end
  end

  resources :account_activations, only: [:edit]

end
