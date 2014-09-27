class ShopsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update]
  def index
    @shops = Shop.all.order(:name)
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
    @shop = Shop.find(params[:id])
    if @shop.update_attributes(shop_params)
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
