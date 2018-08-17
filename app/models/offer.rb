class Offer < ApplicationRecord
  include PgSearch

  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :title, :price, :location, :category, :photo, presence: true

  mount_uploader :photo, PhotoUploader

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  pg_search_scope :search_offers,
    against: [ :title, :category, :location, :description ],
    associated_against: {
      user: :username
    },
    using: {
      tsearch: { prefix: true }
    }

    def self.categories
      ["", "Sound", "Lights", "Drinks", "Decorations", "Costumes", "Entertainment", "Misc"].sort_by!{ |e| e.downcase }
    end
end
