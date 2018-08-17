class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, PhotoUploader

  has_many :offers, dependent: :destroy
  has_many :bookings
  validates :username, presence: true, uniqueness: true
end
