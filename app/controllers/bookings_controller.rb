class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_booking, only: [:show, :destroy]
  layout "user"

  def index
    # user specific bookings list
    @bookings = Booking.user_booked_rooms(current_user.id)
  end

  def new
    @booking = Booking.new
    @url = room_bookings_path
  end

  def create
    @booking = Booking.new(booking_params)
    # append room_id in bookings
    @booking.room_id = params[:room_id]
    
    # check for given start date for current room booking is already booked or not
    unless @booking.is_already_booked?
      # check for room booking is saved or not
      if @booking.save
        # updates status of room to 'booked'
        @booking.room.update_attributes(status: 'booked')
        redirect_to room_booking_path(@booking.room_id, @booking.id)
        flash[:success] = I18n.t('success.booking.created')
      else
        flash[:error] = "#{@booking.errors.full_messages.join(" ")}"
        redirect_to new_room_booking_path
      end
    else
      flash[:error] = I18n.t('errors.booking.already_booked')
      redirect_to new_room_booking_path
    end
  end

  def show; end

  # on deleting booking revert room status to available again
  def destroy
    @booking.room.update_attributes(status: 'available')
    if @booking.destroy
      redirect_to root_path
      flash[:success] = I18n.t('success.booking.cancelled')
    end
  end

private
  # strong parameters
  def booking_params
    params.require(:booking).permit(:user_id ,:room_id, :booked_from, :booked_upto)
  end

  # find the given booking
  def fetch_booking
    begin
      @booking = Booking.find_booking(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = I18n.t('errors.booking.not_found')
      redirect_to root_path
    end
  end
end
