class Api::V1::UsersController < ApiController
  serialization_scope :current_user

  def show
    user = User.find(params[:id])
    spots = user.spots
    render json: spots
  end

end
