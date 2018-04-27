class Api::V1::ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :destroy]

  def index
    render json: Review.all
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
