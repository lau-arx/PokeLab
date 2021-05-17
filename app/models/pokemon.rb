class Pokemon < ApplicationRecord
  belongs_to :user

  # validates :name, :type, :description, :height, :weight, :special_attack, :price_per_day, :health_point, presence: true
end
