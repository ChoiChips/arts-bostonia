class UsersController < ApplicationController
  before_action :authorize_user

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])

    if @user != current_user

      if @user.spots
        spots = @user.spots
        current_user.spots = spots
      end

      @user.destroy

    else
      flash[:notice] = "Admins can't delete own account"
    end
    redirect_to users_path
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      flash[:notice] = "You do not have access to this page."
      redirect_to root_path
    end
  end

end