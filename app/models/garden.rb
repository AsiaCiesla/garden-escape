class Garden < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'

  validates :title, :price_per_hour, :address, presence: true

  has_one_attached :photo
end
