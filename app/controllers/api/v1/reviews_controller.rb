class Api::V1::ReviewsController < ApplicationController
  def index
    render json: Review.all
  end

  def show
    render json: Review.find(params[:id])
  end

  def create
    review = Review.new(review_params)

    if review.save
      flash[:notice] = "Review added successfully"
      # redirect_to 
    else
      flash[:notice] = @review.errors.full_messages.join(", ")
      render action: "show"
    end
  end

  private
  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
