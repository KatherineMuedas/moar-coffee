class ShopsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update]
  before_action :set_shop, only:[:show, :edit, :update]
  def index
    @shops = Shop.all.order(:name)
  end

  def show
    @drinks = @shop.drinks.all
    @favorite = Favorite.find_by_favorable_id(@shop.id)
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
  end

  def update
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

  def set_shop
    @shop = Shop.friendly.find(params[:id])
  end

end
