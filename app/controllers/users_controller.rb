class UsersController < ApplicationController

  def index
    if user_signed_in? &&
      current_user.admin
      @users = User.all
    else
      redirect_to root_path
    end
  end

  def destroy

    @user = User.find(params[:id])
    if @user != current_user
      @user.destroy
    end
    redirect_to users_path
  end

end
