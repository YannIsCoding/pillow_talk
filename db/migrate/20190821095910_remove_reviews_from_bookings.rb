class RemoveReviewsFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_reference :bookings, :review
    add_reference :reviews, :booking, foreign_key: true
  end
end
