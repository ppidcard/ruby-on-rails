Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :properties
  get '/auth/:provider/callback' => 'sessions#omniauth'
  resources :users, except: [:new]
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: "sessions#destroy"
  resources :suburbs, except: [:destroy] do 
    resources :properties
  end

end
