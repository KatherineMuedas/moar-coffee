class FavoritesController < ApplicationController
before_action :authenticate_user!

  def create
    @shop = Shop.friendly.find(params[:shop_id])

    respond_to do |format|
      if Favorite.find_or_create_by(favorable: @shop, user_id: current_user.id )
        format.html { redirect_to @shop }
        format.js
      else
        format.html { redirect_to @shop, alert: "Something went wrong!" }
      end
    end
  end

  def destroy
    @shop = Shop.friendly.find(params[:id])
    @favorite = Favorite.find_by_favorable_id(@shop.id)

    respond_to do |format|
      if current_user.id == @favorite.user_id
        @favorite.destroy
        format.html { redirect_to @shop }
        format.js
      else
        format.html { redirect_to @shop, alert: "You cannot do that!" }
      end
    end
  end

end
