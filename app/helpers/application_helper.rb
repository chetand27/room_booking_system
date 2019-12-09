module ApplicationHelper
  def booking_user_name(user)
    user_presenter = UserPresenter.new(user)
    user_presenter.full_name
  end

  def formatted_booking_date(booking)
		booking_serializer = BookingSerializer.new(booking)
		return booking_serializer.booked_from + ' To ' + booking_serializer.booked_upto
  end
end
