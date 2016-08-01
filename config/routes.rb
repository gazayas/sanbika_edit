Rails.application.routes.draw do

  get 'home/index'

  get 'password_resets/new'

  get 'password_resets/edit'

  # root :to => 'users#index'
  root :to => 'home#index'

  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users do

    resources :songs #do

    get '/print/:id' => 'songs#print'
      #resources :likes
    #end
  end
  get 'users/:name' => 'users#show'

  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]

end
