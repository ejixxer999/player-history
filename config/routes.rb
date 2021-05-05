Rails.application.routes.draw do
  root 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  resources :cities do
    resources :teams
  end
  resources :users, only:[:new, :create, :show, :index] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
