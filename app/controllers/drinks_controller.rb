class DrinksController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update]
  before_action :set_shop
  before_action :set_drink, only:[:show, :edit, :update]
  

  def show
    @drinks = @shop.drinks.all
    @pictures = @drink.pictures.all
    @favorite = Favorite.find_by_favorable_id(@drink.id)
  end

  def new
    @drink = Drink.new
  end

  def create
    @drink = @shop.drinks.create(drink_params)

    respond_to do |format|
      if @drink.save
        @drinks = @shop.drinks
        format.html { redirect_to @shop }
        format.js
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
    @drink = Drink.friendly.find(params[:id])
  end

end
