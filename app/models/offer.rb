class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, :price, :location, :category, presence: true

end
