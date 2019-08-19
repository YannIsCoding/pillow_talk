class Pillow < ApplicationRecord
  validates :category, :address, :image, presence: true

  has_many :bookings
end
