class ReviewsController < ApplicationController
  before_action :find_shop, only: [:create]
  before_action :find_drink, only: [:create]
  before_action :authenticate_user!

  def create
    @reviews = current_user.reviews.all.where.not(review_type: "checkin")
    @review = @drink.reviews.new(reviews_params)
    @review.user_id = current_user.id 

    respond_to do |format|
      if @review.save
        @review.review_type == :review ? current_user.give_points(5) : current_user.give_points(2)
        @review.create_activity :create, owner: current_user, follow_id: current_user.id
        format.html { redirect_to :back }
        format.js
      else
        format.html { redirect_to :back, alert: 'Review was not created' }
      end
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
    if #TODO: define this conditional
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

