class Review < ApplicationRecord
  belongs_to :booking
  has_one :user, through: :booking

  validates :rating, inclusion: { in: (1..5) }
  validates :comment, presence: true
end
