Rails.application.routes.draw do
 
  devise_for :users
  resources :users
  resources :shops do
    resources :drinks 
  end
  resources :reviews
 root to: 'shops#index'

end
