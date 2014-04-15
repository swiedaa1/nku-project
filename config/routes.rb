NkuProject::Application.routes.draw do

  resources :lists
  resources :users
  resources :sessions
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    get 'logout' => :destroy
  end
  root 'lists#index'
end
