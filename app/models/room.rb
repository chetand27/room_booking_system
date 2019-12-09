class Room < ApplicationRecord
  enum status: [ :available, :booked ]
  enum category: [ :deluxe, :luxury, :luxury_suites, :presidential_suites ]

  has_many :bookings, class_name: 'Booking'
  has_many :users, class_name: 'User', through: :bookings

  validates :room_number, :category, :description, :charged_per_night, presence: true
  
  scope :order_by, -> { order('created_at asc') }
  scope :group_by_category, -> { group_by(&:category) }

  # returns all the category wise available rooms
  scope :available_rooms_by_categories, -> { where(status: 0).order_by.group_by_category }
  
  # returning all available rooms by booking date
  scope :available_rooms_by_date, -> (date) { where.not(id: Booking.already_booked_rooms(date)).order_by.group_by_category }

  # returning all available rooms by booking date
  scope :available_rooms_by_type, -> (type) { where(category: type) }
end
