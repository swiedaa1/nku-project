NkuProject::Application.routes.draw do

  resources :lists
  resources :users
  root 'lists#index'
end
