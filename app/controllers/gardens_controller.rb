class GardensController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_garden, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @gardens = Garden.search_by_title_and_address(params[:query])
    else
      @gardens = Garden.all
    end

    @markers = @gardens.geocoded.map do |garden|
      {
        lat: garden.latitude,
        lng: garden.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { garden: garden }),
        image_url: helpers.asset_url('barrow.png')
      }
    end
  end

  def show; end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(garden_params)
    @garden.owner = current_user
    if @garden.save!
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @garden.update(garden_params)
      redirect_to garden_path(@garden)
    else
      render :edit
    end
  end

  def destroy
    @garden.destroy
    redirect_to gardens_path
  end

  def mygardens
    @gardens = current_user.gardens
    @bookings = Booking.upcoming.joins(garden: :owner).where(gardens: { owner: current_user })
  end

  private

  def garden_params
    params.require(:garden).permit(:title, :description, :price_per_hour, :address, :photo)
  end

  def set_garden
    @garden = Garden.find(params[:id])
  end
end
