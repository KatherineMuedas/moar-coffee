class ReviewsController < ApplicationController
  before_action :find_drink, only: [:new, :create]
  before_action :authenticate_user!

  def new
  end

  def create
    @review = @drink.reviews.new(reviews_params)
    @review.user_id = current_user.id 
    @shop = Shop.find(@drink.shop_id)
    if @review.save
      redirect_to shop_path(@shop)
    else
      redirect_to :back, notice: 'Review was not created'
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
      render 'edit', notice: 'Review was not created'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to :back, notice: 'Your review was succesfully deleted'
  end

  private

  def reviews_params
    params.require(:review).permit(:title, :body, :drink_rating, :drink_id)
  end

  def find_drink  
    @drink = Drink.find(params[:drink_id])
  end
end

