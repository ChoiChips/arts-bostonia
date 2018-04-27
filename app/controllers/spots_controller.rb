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
    if @spot.save
      flash[:success] = 'Spot added successfully'
      @spot.save
      redirect_to @spot
    else
      @errors = @spot.errors.full_messages
      # flash[:failure] = errors
      render :new

    end
  end

  def edit

  end


  def spot_params
    params.require(:spot).permit(:name, :location, :photo, :artist, :description)
  end

end
