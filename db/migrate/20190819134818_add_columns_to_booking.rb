class AddColumnsToBooking < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :user, foreign_key: true
    add_reference :bookings, :review, foreign_key: true
    add_column :bookings, :start_date, :date
    add_column :bookings, :end_date, :date
    add_reference :bookings, :pillow, foreign_key: true
  end
end
