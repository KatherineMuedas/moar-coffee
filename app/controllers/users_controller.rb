class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.friendly.find(params[:id])
    @reviews = @user.reviews
    @shop_follows = @user.following_by_type('Shop')
    @user_follows = @user.following_by_type('User')
    @pictures = @user.pictures.order(created_at: :desc)
  end

  def create
    @user = User.create( user_params )
  end
  def update
     if @last_name.update_attributes(last_name, params)
    end
  end

private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

  def user_params
    params.require(:user).permit(:avatar, :name, :zipcode, :gender)
  end

end
