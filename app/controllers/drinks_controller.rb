class DrinksController < ApplicationController
  before_action :set_shop
  before_action :authenticate_user!, only:[:new, :create, :edit, :update]

  def show
    @drink = Drink.find(params[:id])
    @drinks = @shop.drinks.all
  end

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
    @drink = @shop.drinks.find_by(id: params[:id])
  end

  def update
    @drink = @shop.drinks.find_by(id: params[:id])

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
    @shop = Shop.find(params[:shop_id])
  end
end
