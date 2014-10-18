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
    @pictures = @shop.pictures.all.order(created_at: :desc)
  end

  def new
    @shop = Shop.new
    @location = @shop.build_location
    # @shop.pictures = build_pictures
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      current_user.give_points(5)
      redirect_to @shop
      flash[:notice] = "Cafe successfully created" 
    else
      render 'new'
    end

  end

  def edit
    @location = @shop.location
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
    pictures_attributes = [:id, :caption, :photo, :user_id]
    location_attributes = [:id, :shop_id, :city, :state, :zipcode, :street_address]
    params.require(:shop).permit(:name, :description, :website, location_attributes: location_attributes, pictures_attributes: pictures_attributes)
    
  end

  def set_shop
    @shop = Shop.friendly.find(params[:id])
  end

end
