class Pillow < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  validates :category, :address, presence: true

  has_many :bookings, dependent: :destroy
end
