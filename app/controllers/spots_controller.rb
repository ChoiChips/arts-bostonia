class SpotsController < ApplicationController

  def index
    #@spots = Spot.all
  end
  def show
    #@spot = Spot.find(params[:id] )
  end
  def new
    @spot = Spot.new
  end
  def create
    @spot = Spot.new(spot_params)
    @spot.save

  end


  def spot_params
    params.require(:spot).permit(:name, :location, :photo, :artist, :description)
  end

end
