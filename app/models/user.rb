class User < ApplicationRecord
  has_many :offers, dependent: :destroy
  has_many :bookings
  validates :username, presence: true, uniqueness: true
end
