class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
end
