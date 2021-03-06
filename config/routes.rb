Rails.application.routes.draw do
  root to: 'toppages#index' 
  get 'about', to: 'toppages#about'
  # ----janres----
  get 'janres/manga', to: 'toppages#mangas'
  get 'janres/anime', to: 'toppages#animes'
  get 'janres/game', to: 'toppages#games'
  get 'janres/movie', to: 'toppages#movies'
  get 'janres/other', to: 'toppages#others'
  # --------------
  
  # facebook
	get '/auth/:provider/callback', to: 'users#create', as: :auth_callback
  get '/auth/failure', to: 'users#auth_failure', as: :auth_failure
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users, except: [:index] do
  	member do
  		get :likes
  		get :followings
  		get :followers
  	end
  end
  resources :blogs, except: [:index] do
  	resources :comments, only: [:create, :destroy]
  end
  resource :account, only: [:show, :edit, :update]
  resource :password, only: [:show, :edit, :update]
  resources :favorites, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
