NodeExpressApp::Application.routes.draw do
  resources :users
  resources :items
  resources :sessions, :only => [:new, :create, :destroy]

  # get '/items/hello', to: 'items#hello'
  match 'hello', :controller => 'items', :action => 'hello', via: [:post]
  # You can have the root of your site routed with "root"
  root 'sessions#new'

end
