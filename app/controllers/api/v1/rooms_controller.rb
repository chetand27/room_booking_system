class Api::V1::RoomsController < ApplicationController

  def index
    if params[:booking_date].present? && params[:room_type].present?
      # Collected which available on given date and for particular room_type
      @available_rooms = Room.available_rooms_by_type(params[:room_type]).available_rooms_by_date(params[:booking_date])
    elsif params[:booking_date].present?
      # Collected rooms which available on given date
      @available_rooms = Room.available_rooms_by_date(params[:booking_date])
    elsif params[:room_type].present?
      # Collected particular room type rooms which is available
      @available_rooms = Room.available_rooms_by_type(params[:room_type]).available_rooms_by_categories
    else
      # returning errors msg if no parameters are given
        return render json: { errors: I18n.t('errors.room.send_params') }
    end
  end
end
