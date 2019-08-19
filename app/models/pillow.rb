class Pillow < ApplicationRecord
  validates :category, :address, presence: true
end
