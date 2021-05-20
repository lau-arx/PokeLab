class Pokemon < ApplicationRecord
  belongs_to :user
  # has_one :user, through: :booking

  validates :name, :category, :description, :height, :weight, :special_attack, :price_per_day, :health_point, :address, presence: true

  has_many :bookings, dependent: :destroy

  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end

  # def period_available(start, end)
  #     all_booking = bookings.where("start_date < :start AND end_date > :start", start: start)
  #                           .or(bookings.where("start_date < :start AND end_date > :end", start: start, end: end))
  #                           .or(bookings.where("start_date < :start AND end_date > :end"))
  #     all_booking.empty?
  # end

  # def availability(start, end)

  # Recuperer tous les booking qui sont entre la start et end
  # Ou a cheval sur la periode start a end

  # construire un array qui contient tous les jours de la start a la end

  # Iterer sur tous les booking qu'on a recupéré
    # Iterer sur tous les jours pris par les booking
    # On supprime ce jour dans notre array
  #end

  # Si l'array est vite je retourne false si il n'est pas vide je retoune true





