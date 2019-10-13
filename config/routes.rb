Rails.application.routes.draw do
  root to: 'toppages#index'
  
  resources :users, except: [:index]
end
