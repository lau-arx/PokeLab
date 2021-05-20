class RemoveEndDateFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :end_date, :string
  end
end
