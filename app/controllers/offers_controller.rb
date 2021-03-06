class OffersController < ApplicationController
  before_action :find_offer, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @offers = Offer.where.not(latitude: nil, longitude: nil)
  end

  def show
    @booking = Booking.new
    @markers = [{
      lat: @offer.latitude,
      lng: @offer.longitude
    }]

  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    if @offer.save
      redirect_to offer_path(@offer)
    else
      Offer.categories;
      render :new
    end
  end

  def edit; end

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
