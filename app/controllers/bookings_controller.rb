class BookingsController < ApplicationController
  before_action :find_offer

  def new
    @booking = @offer.bookings.new(booking_params)
  end

  def create
    @booking = @offer.bookings.new(booking_params)
    if @booking.save
      redirect_to offers_path
    else render :new
    end
  end

  private

  def find_offer
    @offer = Offer.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
