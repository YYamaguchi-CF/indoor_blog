Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users, except: [:index]
  resources :blogs, except: [:index]
  resource :account, only: [:show, :edit, :update]
  resource :password, only: [:show, :edit, :update]
end
