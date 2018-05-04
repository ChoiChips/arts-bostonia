require 'open-uri'
require 'json'

class SpotsController < ApplicationController

  before_action :authorize_user, except: [:index,:show]
  before_action :authorize_admin, only: [:destroy]

  def index
  end

  def show
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user = current_user

    # maps_api = "https://maps.googleapis.com/maps/api/geocode/json?address="
    # maps_key = "&key=AIzaSyDdoQwbpjX0qKeTQ5prao4PBCHRp2z7K0g"
    # maps_spot_address = @spot.location
    # maps_api_call = maps_api + maps_spot_address + maps_key
    # response = JSON.parse(open(maps_api_call).read)

    binding.pry

    if @spot.save
      flash[:success] = 'Spot added successfully'
      @spot.save
      redirect_to @spot
    else
      @errors = @spot.errors.full_messages
      render :new
    end
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])

    if @spot.update(spot_params)
      flash[:success] = 'Spot updated successfully'
      @spot = @spot.update(spot_params)
      redirect_to spot_path
    else
      @errors = @spot.errors.full_messages
      render :edit
    end

  end

  def destroy
    spot = Spot.find(params[:id])
    reviews = spot.reviews
    spot.destroy
    reviews.destroy_all
    redirect_to users_path
  end

  protected
  def spot_params
    params.require(:spot).permit(:name, :location, :photo, :artist, :description, :location_lat, :location_lng)
  end

  def authorize_user
    if !user_signed_in?
      flash[:notice] = "You do not have access to this page."
      redirect_to root_path
    end
  end

  def authorize_admin
    if !user_signed_in? || !current_user.admin?
      flash[:notice] = "You do not have access to this page."
      redirect_to root_path
    end
  end

end
