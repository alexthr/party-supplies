class OffersController < ApplicationController
  before_action :find_offer, only: [:show, :edit, :update, :destroy]

  def index
    @offers = Offer.all
  end

  def show
    @booking = Booking.new
    @marker = {
      lat: @offer.latitude,
      long: @offer.longitude
    }
  end

  def new
    @offer = Offer.new
    @categories = ["Sound", "Lights", "Drinks", "Decorations", "Costumes", "Entertainment", "Misc"];
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    @offer.save
    redirect_to offer_path(@offer)
  end

  def edit
  end

  def update
    @offer.update(offer_params)
    redirect_to offer_path(@offer)
  end

  def destroy
    @offer.destroy
    redirect_to offers_path
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :price, :category, :location, :photo)
  end

  def find_offer
    @offer = Offer.find(params[:id])
  end
end
