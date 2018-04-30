class SpotsController < ApplicationController

  before_action :authorize_user, except: [:index,:show]


  def index
    # @last = Spot.last
    # binding.pry
  end

  def show
  end

  def new
    @spot = Spot.new
  end
  def create
    # how do we specify the full AWS path before storing it in the DB:
    # img_filename = spot_params[:photo].original_filename
    # aws_url = "https://s3.amazonaws.com/arts-bostonia/arts-bostnia-development/"
    # spot_params[:photo] = aws_url + img_filename


    @spot = Spot.new(spot_params)
    # @spot.photo = aws_url + img_filename
    # binding.pry
    # img_directory = "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}/"

    # if Rails.env.development?
    #   @spot.photo = aws_url + img_directory + "#{@spot.photo.filename}"
    #   binding.pry
    # end

    @spot.user = current_user
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
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])

    if @spot.update(spot_params)
      flash[:success] = 'Spot updated successfully'
      @spot = @spot.update(spot_params)
      redirect_to spot_path
    else
      # flash[:fail] = 'Spot failed update'
      @errors = @spot.errors.full_messages
      render :edit

    end

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
