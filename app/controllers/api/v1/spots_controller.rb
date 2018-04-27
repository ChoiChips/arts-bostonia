class Api::V1::SpotsController < ApiController
<<<<<<< HEAD

  serialization_scope :current_user

=======
>>>>>>> 65beb28ab14ce63bc8a957df8f58ae27f37cf284
  def index
    render json: Spot.all
  end

  def show
    render json: Spot.find(params[:id]), serializer: SpotShowSerializer
  end
end
