class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :garden, null: false, foreign_key: true
      t.boolean :accepted, default: false
      t.date :start_date_time
      t.date :end_date_time

      t.timestamps
    end
  end
end
