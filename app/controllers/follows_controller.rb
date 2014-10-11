class FollowsController < ApplicationController

  def create
    @shop = Shop.friendly.find(params[:shop_id])

    respond_to do |format|
      if  current_user.follow(@shop)
        current_user.follow(@shop).create_activity :create, owner: current_user, follow_id: @shop.id
        format.html{redirect_to :back}
        format.js
      end
    end
  end

  def destroy
    @shop = Shop.friendly.find(params[:shop_id])
    respond_to do |format|
      current_user.stop_following(@shop)
      format.html{redirect_to :back}
      format.js
    end
  end

end


