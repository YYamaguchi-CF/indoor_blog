Rails.application.routes.draw do
  root to: 'toppages#index' 
  # ----janres----
  get 'janres/manga', to: 'toppages#mangas'
  get 'janres/anime', to: 'toppages#animes'
  get 'janres/game', to: 'toppages#games'
  get 'janres/movie', to: 'toppages#movies'
  get 'janres/other', to: 'toppages#others'
  # --------------
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users, except: [:index] do
  	member do
  		get :likes
  	end
  end
  resources :blogs, except: [:index]
  resource :account, only: [:show, :edit, :update]
  resource :password, only: [:show, :edit, :update]
  resources :favorites, only: [:create, :destroy]
end
