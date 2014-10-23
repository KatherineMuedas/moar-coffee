class DrinksController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update]
  before_action :set_shop
  before_action :set_drink, only:[:show, :edit, :update]
  
  def show
    @drinks = @shop.drinks.all
    @reviews = @drink.reviews.where(review_type: :review)
    @checkins = @drink.reviews.where(review_type: :checkin)
    @pictures = @drink.pictures.all.order(created_at: :desc)
    @favorite = Favorite.find_by_favorable_id(@drink.id)
  end

  def new
    @drink = Drink.new
  end

  def create
    @drink = @shop.drinks.create(drink_params)
    @activities = PublicActivity::Activity.where(shop_id: @shop.id).order(created_at: :desc)

    respond_to do |format|
      if @drink.save
        current_user.give_points(10)
        @drink.create_activity :create, owner: current_user, follow_id: @shop.id, shop_id: @shop.id
        @drinks = @shop.drinks
        format.html { redirect_to @shop}
        format.js
        flash[:notice] = "Coffee successfully created" 
      else
        format.js
      end
    end
  end

  def edit
  end

  def update
    if @drink.update_attributes(drink_params)
      redirect_to shop_drink_path(@shop, @drink)
    else
      render :edit
    end
  end

  private
  def drink_params
    pictures_attributes = [:id, :caption, :photo, :user_id]
    params.require(:drink).permit(:name, :description, pictures_attributes: pictures_attributes)
  end

  def set_shop
    @shop = Shop.friendly.find(params[:shop_id])
  end

  def set_drink
    @drink = @shop.drinks.friendly.find(params[:id])
  end

end
