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

# == Route Map
#
#                   Prefix Verb     URI Pattern                                Controller#Action
#                    stats GET      /stats(.:format)                           stats#index
#               activities GET      /activities(.:format)                      activities#index
#                          POST     /activities(.:format)                      activities#create
#             new_activity GET      /activities/new(.:format)                  activities#new
#            edit_activity GET      /activities/:id/edit(.:format)             activities#edit
#                 activity GET      /activities/:id(.:format)                  activities#show
#                          PATCH    /activities/:id(.:format)                  activities#update
#                          PUT      /activities/:id(.:format)                  activities#update
#                          DELETE   /activities/:id(.:format)                  activities#destroy
#                favorites POST     /favorites(.:format)                       favorites#create
#                 favorite DELETE   /favorites/:id(.:format)                   favorites#destroy
#         new_user_session GET      /users/sign_in(.:format)                   devise/sessions#new
#             user_session POST     /users/sign_in(.:format)                   devise/sessions#create
#     destroy_user_session DELETE   /users/sign_out(.:format)                  devise/sessions#destroy
#            user_password POST     /users/password(.:format)                  devise/passwords#create
#        new_user_password GET      /users/password/new(.:format)              devise/passwords#new
#       edit_user_password GET      /users/password/edit(.:format)             devise/passwords#edit
#                          PATCH    /users/password(.:format)                  devise/passwords#update
#                          PUT      /users/password(.:format)                  devise/passwords#update
# cancel_user_registration GET      /users/cancel(.:format)                    devise/registrations#cancel
#        user_registration POST     /users(.:format)                           devise/registrations#create
#    new_user_registration GET      /users/sign_up(.:format)                   devise/registrations#new
#   edit_user_registration GET      /users/edit(.:format)                      devise/registrations#edit
#                          PATCH    /users(.:format)                           devise/registrations#update
#                          PUT      /users(.:format)                           devise/registrations#update
#                          DELETE   /users(.:format)                           devise/registrations#destroy
#  user_omniauth_authorize GET|POST /users/auth/:provider(.:format)            omniauth_callbacks#passthru {:provider=>/facebook/}
#   user_omniauth_callback GET|POST /users/auth/:action/callback(.:format)     omniauth_callbacks#:action
#              leaderboard GET      /leaderboard(.:format)                     users#leaderboard
#        user_follow_users POST     /users/:user_id/follow_users(.:format)     follow_users#create
#         user_follow_user DELETE   /users/:user_id/follow_users/:id(.:format) follow_users#destroy
#                    users GET      /users(.:format)                           users#index
#                     user GET      /users/:id(.:format)                       users#show
#         find_shops_shops GET      /shops/find_shops(.:format)                shops#find_shops
#              shop_drinks POST     /shops/:shop_id/drinks(.:format)           drinks#create
#           new_shop_drink GET      /shops/:shop_id/drinks/new(.:format)       drinks#new
#          edit_shop_drink GET      /shops/:shop_id/drinks/:id/edit(.:format)  drinks#edit
#               shop_drink GET      /shops/:shop_id/drinks/:id(.:format)       drinks#show
#                          PATCH    /shops/:shop_id/drinks/:id(.:format)       drinks#update
#                          PUT      /shops/:shop_id/drinks/:id(.:format)       drinks#update
#             shop_follows POST     /shops/:shop_id/follows(.:format)          follows#create
#                    shops GET      /shops(.:format)                           shops#index
#                          POST     /shops(.:format)                           shops#create
#                 new_shop GET      /shops/new(.:format)                       shops#new
#                edit_shop GET      /shops/:id/edit(.:format)                  shops#edit
#                     shop GET      /shops/:id(.:format)                       shops#show
#                          PATCH    /shops/:id(.:format)                       shops#update
#                          PUT      /shops/:id(.:format)                       shops#update
#      shop_follows_delete DELETE   /shops/:shop_id/follows(.:format)          follows#destroy
#            drink_reviews POST     /drinks/:drink_id/reviews(.:format)        reviews#create
#             drink_review DELETE   /drinks/:drink_id/reviews/:id(.:format)    reviews#destroy
#                     root GET      /                                          shops#index
#                     page GET      /pages/*id                                 high_voltage/pages#show
#
