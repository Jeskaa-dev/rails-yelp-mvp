class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[new create]
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end
  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :phone_number)
  end
end


# t.integer :rating
#       t.text :content
#       t.references :restaurant
