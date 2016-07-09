Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

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
  resources :password_resets, only: [:new, :create, :edit, :update]

end
