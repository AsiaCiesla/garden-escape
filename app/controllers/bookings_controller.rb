class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :destroy]

  before_action :find_garden, only: [:new, :create]

  def index
    @upcoming = current_user.bookings.upcoming
    @past = current_user.bookings.past
  end

  def show; end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.garden = @garden
    @booking.guest = current_user

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def update
    @booking.accepted = true
    @booking.save
    redirect_to mygardens_gardens_path(anchor: "booking-#{@booking.id}")
  end

  def destroy
    @booking.destroy
    if current_user == @booking.guest
      redirect_to bookings_path, notice: "Booking successfully cancelled."
    else
      redirect_to mygardens_gardens_path(anchor: "my-listing-bookings"), notice: "Booking successfully cancelled."
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date_time, :end_date_time)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def find_garden
    @garden = Garden.find(params[:garden_id])
  end
end
