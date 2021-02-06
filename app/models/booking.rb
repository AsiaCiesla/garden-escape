class Booking < ApplicationRecord
  belongs_to :guest, class_name: 'User', foreign_key: 'user_id'
  belongs_to :garden

  validates :start_date_time, :end_date_time, presence: true
end
