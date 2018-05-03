class ReviewsController < ApplicationController

before_action :authorize_admin, only: [:destroy]

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to users_path
  end

  def authorize_admin
    if !user_signed_in? || !current_user.admin?
      flash[:notice] = "You do not have access to this page."
      redirect_to root_path
    end
  end

end
