Rails.application.routes.draw do

  resources :cities do
    resources :teams
  end
  resources :users, only:[:new, :create, :show] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
