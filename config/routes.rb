NkuProject::Application.routes.draw do

  resources :items
  resources :users
  resources :sessions
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    get 'logout' => :destroy
  end
  root 'items#index'
end
