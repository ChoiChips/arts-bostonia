class Api::V1::SpotsController < ApiController

  serialization_scope :current_user

  def index
    render json: Spot.all
  end

  def show
    render json: Spot.find(params[:id]), serializer: SpotShowSerializer
  end
end
