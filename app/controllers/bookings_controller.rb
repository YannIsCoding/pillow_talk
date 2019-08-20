class BookingsController < ApplicationController

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

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :pillow_id, :user_id)
  end
end
