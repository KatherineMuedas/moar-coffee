class FavoritesController < ApplicationController
before_action :authenticate_user!

  def create
    @drink = Drink.friendly.find(params[:drink_id])

    respond_to do |format|
      @favorite = Favorite.find_or_create_by(favorable: @drink, user_id: current_user.id )
      if Favorite.find_or_create_by(favorable: @drink, user_id: current_user.id )
        @favorite.create_activity :create, owner: current_user
        format.html { redirect_to :back }
        format.js
      else
        format.html { redirect_to :back, alert: "Something went wrong!" }
      end
    end
  end

  def destroy
    @drink = Drink.friendly.find(params[:id])
    @favorite = Favorite.find_by_favorable_id(@drink.id)

    respond_to do |format|
      if current_user.id == @favorite.user_id
        @favorite.destroy
        format.html { redirect_to :back}
        format.js
      else
        format.html { redirect_to :back, alert: "You cannot do that!" }
      end
    end
  end

end
