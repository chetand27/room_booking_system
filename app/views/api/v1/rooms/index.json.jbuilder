json.array! @available_rooms do |category, rooms|
  json.category category.gsub("_", " ").capitalize
  json.total_rooms rooms.count

  json.rooms rooms do |room|
  	json.id room.id
	  json.room_number room.room_number
	  json.description room.description
	  json.status room.status
	  json.charged_per_night room.charged_per_night
  end
end