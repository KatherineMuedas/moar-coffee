class FavoritesController < ApplicationController
before_action :authenticate_user!

  def create
    @shop = Shop.friendly.find(params[:shop_id])

    if Favorite.find_or_create_by(favorable: @shop, user_id: current_user.id )
      redirect_to @shop
    else
      redirect_to @shop, alert: "Something went wrong!"
    end
  end

  def destroy
    @shop = Shop.friendly.find(params[:id])
    @favorite = Favorite.find_by_favorable_id(@shop.id)

    if current_user.id == @favorite.user_id
      @favorite.destroy
      redirect_to @shop
    else
      redirect_to @shop, alert: "You cannot do that!"
    end
  end

end
