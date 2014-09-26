class DrinksController < ApplicationController
  before_action :set_shop

  def new
    @drink = Drink.new
  end

  def create
    @drink = @shop.drinks.create(drink_params)

    if @drink.save
      redirect_to @shop
    else
      render :new
    end
  end

  def edit
    @drink = @shop.drink.find(params[:shop_id])
  end

  def update
    @drink = @shop.drink.find(params[:shop_id])

    if @drink.update_attributes(drink_params)
      redirect_to @drink
    else
      render :edit
    end
  end

  private
  def drink_params
    params.require(:drink).permit(:name, :description)
  end

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end
end
