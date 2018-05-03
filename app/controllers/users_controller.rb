class UsersController < ApplicationController
  before_action :authorize_admin

  def index
    @users = User.all
    @spots = Spot.all.order(:id)
    @reviews = Review.all.order(:id)
  end

  def destroy
    user = User.find(params[:id])

    if user != current_user
      if user.spots
        spots = user.spots
        current_user.spots = spots
      end
      user.reviews.destroy_all
      user.destroy
    else
      flash[:notice] = "Admins can't delete own account"
    end

    redirect_to users_path
  end

  def authorize_admin
    if !user_signed_in? || !current_user.admin?
      flash[:notice] = "You do not have access to this page."
      redirect_to root_path
    end
  end

end