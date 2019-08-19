class Pillow < ApplicationRecord
  validates :category, :address, :image, presence: true
end
