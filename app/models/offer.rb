class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: destroy
  validates :title, :price, :location, :category, presence: true

end
