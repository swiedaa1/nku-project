NkuProject::Application.routes.draw do

  get "categories/index"
  get "categories/show"
  resources :items
  resources :categories
  resources :users
  resources :sessions
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    get 'logout' => :destroy
  end
  root 'items#index'
end
