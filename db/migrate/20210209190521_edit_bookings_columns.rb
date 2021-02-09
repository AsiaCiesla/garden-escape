class EditBookingsColumns < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :start_date_time, :datetime
    change_column :bookings, :end_date_time, :datetime
  end
end
