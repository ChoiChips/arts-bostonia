class Api::V1::UsersController < ApiController
  serialization_scope :current_user

  def index
    if user_signed_in? &&
      !current_user.nil? &&
      current_user.role == 'member' || current_user.role == 'admin'

      user = User.find(current_user.id)
      spots = user.spots
      render json: spots

    else
      redirect_to root_path
    end
  end
  # spots for a given user
  # def show
  #   user = User.find(params[:id])
  #   spots = user.spots
  #   render json: spots
  # end

end
