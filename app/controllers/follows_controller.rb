class FollowsController < ApplicationController
  def create
    @shop = Shop.friendly.find(params[:shop_id])
    current_user.follow(@shop)
    redirect_to :back
  end

  def destroy
    @shop = Shop.friendly.find(params[:shop_id])
    current_user.stop_following(@shop)
    redirect_to :back
  end
end
