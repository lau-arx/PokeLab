class Pokemon < ApplicationRecord
  belongs_to :user

  validates :name, :category, :description, :height, :weight, :special_attack, :price_per_day, :health_point, :address, presence: true

  has_one :booking

  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
