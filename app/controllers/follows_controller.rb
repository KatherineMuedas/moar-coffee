class FollowsController < ApplicationController
  def create
    @shop = Shop.friendly.find(params[:shop_id])
    if current_user.follow(@shop)
      current_user.follow(@shop).create_activity :create, owner: current_user
    end
    redirect_to :back
  end

  def destroy
    @shop = Shop.friendly.find(params[:shop_id])
    current_user.stop_following(@shop)
    redirect_to :back
  end

end
