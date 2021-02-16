class Booking < ApplicationRecord
  belongs_to :guest, class_name: 'User', foreign_key: 'user_id'
  belongs_to :garden

  validates :start_date_time, :end_date_time, presence: true
  validate :start_in_future
  validate :end_after_start

  scope :upcoming, -> { where("start_date_time > ?", DateTime.now) }
  scope :past, -> { where("start_date_time < ?", DateTime.now) }

  private

  def end_after_start
    if end_date_time < start_date_time
      errors.add(:end_date_time, "must be after the start of the visit.")
    end
  end

  def start_in_future
    if start_date_time < DateTime.now
      errors.add(:start_date_time, "cannot take place in the past!")
    end
  end
end
