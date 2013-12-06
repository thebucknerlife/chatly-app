Chatly::Application.routes.draw do
 
  root to: 'chats#index'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :chats
  resources :users
  resources :sessions

end
