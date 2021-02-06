class Garden < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  # maybe: add has_many :bookings...

  validates :title, :price_per_hour, :address, presence: true
end
