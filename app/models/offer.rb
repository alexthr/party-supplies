class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :title, :price, :location, :category, :photo, presence: true

  mount_uploader :photo, PhotoUploader
end
