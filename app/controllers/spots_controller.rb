class SpotsController < ApplicationController

  def index
    #@spots = Spot.all
  end
  def show
    @spot = Spot.find(params[:id] )
    @reviews = Review.where(spot_id: params[:id])
  end

end
