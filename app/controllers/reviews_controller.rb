class ReviewsController < ApplicationController
  before_action :set_restaurant
  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end
end

private

  def review_params # strong params
    params.require(:review).permit(:content, :rating)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    # check the routes
  end
