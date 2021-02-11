class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update]

  before_action :find_garden, only: [:new, :create]

  # def index
  #   @bookings = Booking.where(guest: current_user)
  #   @user = current_user
  # end

  def show; end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.garden = @garden
    @booking.guest = current_user

    if @booking.save
      redirect_to booking_path(@booking) #CHANGE
    else
      render :new
    end
  end

  def edit; end

  def update
    if @booking.update(booking_params)
      redirect_to gardens_path #TODO
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path #TODO
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
