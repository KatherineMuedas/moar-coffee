class FollowUsersController < ApplicationController
  def create
    @user = User.friendly.find(params[:user_id])

    if current_user.follow(@user)
      current_user.follow(@user).create_activity :create, owner: current_user, follow_id: @user.id
    end
    redirect_to :back
  end

  def destroy
    @user = User.friendly.find(params[:user_id])
    current_user.stop_following(@user)
    redirect_to :back
  end
end
