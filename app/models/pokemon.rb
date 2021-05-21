class Pokemon < ApplicationRecord
  belongs_to :user
  # has_one :user, through: :booking

  validates :name, :category, :description, :height, :weight, :special_attack, :price_per_day, :health_point, :address, presence: true

  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
