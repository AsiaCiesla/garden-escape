class Review < ApplicationRecord
  belongs_to :booking

  validates :content, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }, inclusion: { in: (0..5) }
end
