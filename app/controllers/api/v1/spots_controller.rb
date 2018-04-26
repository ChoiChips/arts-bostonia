class Api::V1::SpotsController < ApiController
  def index
    render json: { spots: Spot.all }
  end
  def show
    render json: { spot: Spot.find(params[:id]) }
  end
end
