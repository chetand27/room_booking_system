json.(@booking, :id, :booked_from, :booked_upto, :created_at)

json.user do
  json.first_name @booking.user.first_name
  json.last_name @booking.user.last_name
  json.email @booking.user.email
  json.phone_number @booking.user.phone_number
end

json.room do
  json.room_number @booking.room.room_number
  json.category @booking.room.category
  json.description @booking.room.description
  json.charged_per_night @booking.room.charged_per_night
  json.status @booking.room.status
end
