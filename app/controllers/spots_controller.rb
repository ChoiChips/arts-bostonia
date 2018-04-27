class SpotsController < ApplicationController

  before_action :authorize_user, except: [:index,:show]

  def index
  end
  def show
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
      # refactor: add this directly to view template with logic
      @errors = @spot.errors.full_messages
      render :new
    end
  end

  def edit

  end

  protected
  def spot_params
    params.require(:spot).permit(:name, :location, :photo, :artist, :description)
  end

  def authorize_user
    if !user_signed_in?
      # raise ActionController::RoutingError.new("Not Found ipsum")
      redirect_to root_path
    end
  end

end
