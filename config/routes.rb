Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  #To display specific routes for article we can use only option.
  #resource :article_name only: [:resource_attr_name]
  resources :articles, only: [:show, :index]
end
