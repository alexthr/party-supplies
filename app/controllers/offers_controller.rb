class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end

  def show
    @offer = Offer.find(params[:id])
    @booking = Booking.new
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
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(offer_params)
    redirect_to offer_path(@offer)
  end

  def destroy

  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :price, :category, :location, :photo)
  end

end
