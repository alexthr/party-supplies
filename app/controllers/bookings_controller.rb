class BookingsController < ApplicationController
  before_action :find_offer

  def new
    booking = Booking.new(find_offer)
  end

  def create
    booking = Booking.new(find_offer)
    if booking.save
      redirect_to offers_path
    else render :new
    end
  end

  private

  def find_offer
    @offer = Offer.find(params[:id])
  end
end
