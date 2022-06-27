Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  
  root 'start#index'
  post 'start/index' => 'start#index'
  
  # Create a route matching POST '/'
  post '/' => 'start#index'
end
