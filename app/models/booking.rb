class Booking < ApplicationRecord
  validates :start_date, :end_date, presence: true
end
