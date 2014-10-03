class ShopsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update]
  before_action :set_shop, only:[:show, :edit, :update]
  def index
    if params[:search].present?
      @shops = Location.near(params[:search], 50).map{|x| x.shop}
    else
      @shops = Shop.all.order(:name)
    end
  end

  def show
    @drinks = @shop.drinks.all
  end

  def new
    @shop = Shop.new
    @location = @shop.build_location
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
    @location = @shop.build_location
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
    location_attributes = [:id, :shop_id, :city, :state, :zipcode, :street_address]
    params.require(:shop).permit(:name, :description, :website, location_attributes: location_attributes)
    
  end

  def set_shop
    @shop = Shop.friendly.find(params[:id])
  end

end
