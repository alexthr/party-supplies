class BookingsController < ApplicationController
  before_action :find_offer, only: [ :new, :create ]

  def new
    @booking = Booking.new
  end

  def create
    @booking = @offer.bookings.new(booking_params)
    @booking.user = current_user
    @booking.save
    redirect_to offer_path(@offer)
  end

  private

  def find_offer
    @offer = Offer.find(params[:offer_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
