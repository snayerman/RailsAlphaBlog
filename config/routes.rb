Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about' => 'pages#about'
  get 'logout' => 'pages#logout'

  resources :articles

  get 'signup' => 'signup#show'
  post 'signup' => 'signup#create'

  get 'login' => 'login#show'
  post 'login' => 'login#create'
end
