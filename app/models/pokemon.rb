class Pokemon < ApplicationRecord
  belongs_to :user

  validates :name, :category, :description, :height, :weight, :special_attack, :price_per_day, :health_point, presence: true

  has_one :booking

  has_one_attached :photo
end
