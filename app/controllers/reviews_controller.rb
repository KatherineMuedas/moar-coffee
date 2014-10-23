class ReviewsController < ApplicationController
  before_action :find_shop, only: [:new, :create]
  before_action :find_drink, only: [:new, :create]
  before_action :authenticate_user!

  def create
    @review = @drink.reviews.new(reviews_params)
    @review.user_id = current_user.id

    if @review.save 
      if @review.review_type == :review
        @review.create_activity :create, owner: current_user, follow_id: @shop.id
        current_user.give_points(5)
      else
        current_user.give_points(2)
      end
      redirect_to :back
    else
      redirect_to :back, notice: 'Review was not created please make sure you complete required fields'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
   
    if @review.update(params[:id])
      redirect_to shop_path(@shop)
    else
      render 'edit', notice: 'Review was not updated'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @activity =  PublicActivity::Activity.find_by_trackable_id(@review)
    if @review.destroy
      @activity.destroy
      redirect_to :back, notice: 'Your review was successfully deleted'
    end
  end

  private

  def reviews_params
    if 
    picture_attributes = [:id, :caption, :photo, :user_id]
    params.require(:review).permit(:title, :body, :drink_rating, :drink_id,:review_type, :shop_id, picture_attributes: picture_attributes)
    else
    flash[:notice] = "Please select a number" 
    end

  end
  def find_shop
    @shop = Shop.friendly.find(params[:review][:shop_id])
  end  
  def find_drink  
    @drink = @shop.drinks.friendly.find(params[:drink_id])
  end
end

