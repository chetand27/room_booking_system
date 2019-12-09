class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validate :room_booking_criteara
 
  # retruning all the user booked rooms.
  scope :user_booked_rooms, -> (user) { includes(:user, :room).where(user_id: user) }
 
  # retruning booking for given id
  scope :find_booking, -> (id) { includes(:user, :room).find(id) }
  

  # added validations on some conditions
  def room_booking_criteara
    if booked_from < Date.today
      errors.add(:booked_from, "You can't be booked room for past date.")
    elsif booked_upto < booked_from
      errors.add(:booked_from, "Please check end date is smaller than start date.")
    elsif booked_from > booked_upto
      errors.add(:booked_from, "Please check start date is greater than end date.")
    elsif booked_from > Date.today + 6.months
    	errors.add(:booked_from, "Booking is available upto 6 months from now.")
    end
  end

  # retruning true or false
  def is_already_booked?
  	booking = Booking.find_by_room_id(room_id)
  	booked_from.between?(booking.booked_from, booking.booked_upto) if booking.present?
  end

  # collected given dates bookings ids
  def self.already_booked_rooms(date)
    booked_room_ids = []
    
    # create partial table for bookings to improve execution time 
    query = <<-SQL
    WITH all_bookings AS (
      SELECT b.id,
             b.booked_from,
             b.booked_upto,
             b.room_id,
             b.user_id
      FROM bookings as b
    )

    select * from all_bookings;
    SQL
    
    # convert response to array
    all_bookings = ActiveRecord::Base.connection.execute(query).to_a

    # iterate normal array it won't take relational mapping
    all_bookings.each do |booking|
      # check given date is between form and upto date if is there then pushed into booked array
      if date.between?(booking['booked_from'], booking['booked_upto'])
        booked_room_ids << booking['room_id']
      end
    end

    return booked_room_ids
  end
end
