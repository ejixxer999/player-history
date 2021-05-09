Rails.application.routes.draw do
  root 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/auth/google_oauth2/callback' => 'sessions#google_login'


  resources :cities
  resources :teams
  
  resources :cities do
    resources :teams, only: [:create, :show, :new, :edit, :index]
  end
  resources :users, only: [:new, :create, :show] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
