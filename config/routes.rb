Rails.application.routes.draw do

  resources :activities
  resources :favorites, only: [:create, :destroy]
  devise_for :users
  resources :users, only: [:show, :index] do
    resources :follows, only: [:create, :destroy]
  end

  resources :shops, except: [:destroy] do
    resources :drinks, except: [:index, :destroy] 
  end
  
  resources :drinks, only: [] do
    resources :reviews, only: [:create, :destroy]
  end
  # post '/drinks/:drink_id/review', to: 'reviews#create'
  # delete '/drinks/:drink_id/review/:id', to: 'reviews#destroy'
  
  root to: 'shops#index'

end
