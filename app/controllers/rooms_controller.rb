class RoomsController < ApplicationController
  layout 'user'
  
  def index
    @available_rooms_by_categories = Room.available_rooms_by_categories
  end
end
