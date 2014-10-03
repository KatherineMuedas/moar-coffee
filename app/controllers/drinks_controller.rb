class DrinksController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update]
  before_action :set_shop
  before_action :set_drink, only:[:show, :edit, :update]
  

  def show
    @drinks = @shop.drinks.all
    @favorite = Favorite.find_by_favorable_id(@drink.id)
  end

  def new
    @drink = Drink.new
  end

  def create
    @drink = @shop.drinks.create(drink_params)

    respond_to do |format|
      if @drink.save
        @drink.create_activity :create, owner: current_user
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
      redirect_to @shop
    else
      render :edit
    end
  end

  private
  def drink_params
    params.require(:drink).permit(:name, :description)
  end

  def set_shop
    @shop = Shop.friendly.find(params[:shop_id])
  end

  def set_drink
    @drink = Drink.friendly.find(params[:id])
  end

end
