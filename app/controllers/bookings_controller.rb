class BookingsController < ApplicationController
before_action :find_booking, only: [:detroy]

  def index
    @bookings = Booking.where(user: current_user)
  end

  def show

  end

  def new
    @booking = Booking.new
  end

  def create

    @booking = Booking.new(booking_params)
    raise
    @booking.save

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
    params.require(:booking).permit(:start_date, :end_date, :pillow_id, :user_id)
  end
end
