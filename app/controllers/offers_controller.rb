class OffersController < ApplicationController
  def index
    @offers = Offer.all
    if params[:search]
      @offers = Offer.search(params[:search]).order("created_at DESC")
    else
      @offers = Offer.all.order('created_at DESC')
    end
  end

  def show
    @offer = Offer.find(params[:id])
    @booking = Booking.new
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
