class BookingsController < ApplicationController

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

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
