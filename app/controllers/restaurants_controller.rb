class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :update, :edit, :destroy]
  # before_action(:set_restaurant, [])
  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
      if @restaurant.save
        redirect_to restaurant_path(@restaurant)
      else
      render :new
      end
  end

  def edit # display a form to edit a restaurant
  end

  def update # the update button on the edit form
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def restaurant_params # strong params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
