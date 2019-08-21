class Pillow < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  validates :category, :address, presence: true

  has_many :bookings
  has_many :reviews, through: :bookings
end
