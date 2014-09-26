class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
    @drinks = @shop.drinks.all

  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to @shop
    else
      render 'new'
    end

  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.update(params[:id])
    if @shop.update
      redirect_to shop_path
    else
      render 'edit'
    end
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :description, :website)
  end

end
