class Pillow < ApplicationRecord

  validates :category, :address, presence: true

  has_many :bookings

end
