class Api::V1::BookingsController < ApplicationController
  before_action :authenticate_user!

  def show
    begin
      @booking = Booking.find_booking(params[:id])
    rescue ActiveRecord::RecordNotFound
      return render json: { errors: I18n.t('errors.booking.not_found') }
    end
  end
end