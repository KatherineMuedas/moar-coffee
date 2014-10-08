class FollowsController < ApplicationController
  def create
    @shop = Shop.friendly.find(params[:shop_id])
    current_user.follow(@shop)
    respond_to |format|
      format.html{redirect_to :back}
      format.js
    end
  end

  def destroy
    @shop = Shop.friendly.find(params[:shop_id])
    current_user.stop_following(@shop)
    redirect_to :back
  end

end
