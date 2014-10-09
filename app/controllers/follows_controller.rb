class FollowsController < ApplicationController
  def create
    @shop = Shop.friendly.find(params[:shop_id])
    respond_to do |format|
      current_user.follow(@shop)
      format.html{redirect_to :back}
      format.js
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


