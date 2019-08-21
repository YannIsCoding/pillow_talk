class ReviewsController < ApplicationController

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    user = current_user
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save
      redirect_to pillow_path(@booking.pillow)
    else
      render 'reviews/new'
    end
  end


  def destroy

  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :booking_id)
  end
end
