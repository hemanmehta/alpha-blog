Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  #To display specific routes for article we can use only option.
  #resource :article_name only: [:resource_attr_name]
  #resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :articles
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories, except: [:destroy]
end
