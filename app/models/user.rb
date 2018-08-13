class User < ApplicationRecord
  has_many :offers
  has_many :bookings
  validates :username, presence: true, uniqueness: true
end
