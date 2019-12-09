class BookingSerializer < ApplicationSerializer
  attributes :starts_on, :ends_on
 
  formatted_date attribute: :booked_from
  formatted_date attribute: :booked_upto
end