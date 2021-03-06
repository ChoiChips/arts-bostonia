class Api::V1::ReviewsController < ApplicationController

  def index
    if params[:spot_id]
      spot = Spot.find(params[:spot_id])
      reviews = spot.reviews
    else
      spots = Spot.all
      reviews = spots
    end
    render json: reviews
  end

  def show
    render json: Review.find(params[:id])
  end


  def create
    review = Review.new(review_params)

    review.spot = Spot.find(params[:spot_id])
    review.user= current_user
    review.save

    render json: review
  end

  private
  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
