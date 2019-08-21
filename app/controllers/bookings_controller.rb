class BookingsController < ApplicationController
before_action :find_booking, only: [:detroy]

  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @pillow = Pillow.find(params[:pillow_id])
    @booking = Booking.new
  end

  def create
    user = current_user
    pillow = Pillow.find(params[:pillow_id])
    @booking = Booking.new(booking_params)
    @booking.user = user
    @booking.pillow = pillow
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def find_booking
    @booking = Booking.find(booking_params)
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
