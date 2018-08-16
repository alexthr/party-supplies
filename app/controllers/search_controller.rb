class SearchController < ApplicationController
  def search
    if params[:query]
      @offers=  Offer.search_offers(params[:query])
    else
      @offers = Offer.all.order("created_at DESC")
    end
    @markers = @offers.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude
      }
    end
  end
end
