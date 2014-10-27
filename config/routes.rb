  Rails.application.routes.draw do

  get "/stats", to: "stats#index", as: :stats
  resources :activities
  resources :favorites, only: [:create, :destroy]

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  get "/leaderboard", to: "users#leaderboard" , as: :leaderboard
  resources :users, only: [:show, :index] do
    resources :follow_users, only: [:create, :destroy]
  end

  resources :shops, except: [:destroy] do
    collection do
      get "/find_shops", to: "shops#find_shops"
    end
    resources :drinks, except: [:index, :destroy]
    resources :follows, only: [:create] do
    end
  end
  delete 'shops/:shop_id/follows' => 'follows#destroy', as: 'shop_follows_delete'
  
  resources :drinks, only: [] do
    resources :reviews, only: [:create, :destroy]
  end
  # post '/drinks/:drink_id/review', to: 'reviews#create'
  # delete '/drinks/:drink_id/review/:id', to: 'reviews#destroy'
  
  root to: 'shops#index'

end
