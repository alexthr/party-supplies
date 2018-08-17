class SearchController < ApplicationController
  def search
    if params.keys.include?("query")
      session[:query_param] = params[:query]
      session[:category_param] = ""
    elsif params.keys.include?("category")
      session[:category_param] = params[:category]
    end

    if session[:query_param].present?
      @offers = Offer.search_offers("#{session[:query_param]} #{session[:category_param]}")
    else
      @offers = Offer.all.order("created_at DESC")
    end

    if params[:pricemin] || params[:pricemax]
      @pricemin = params[:pricemin]
      @pricemax = params[:pricemax]
      @offers = Offer.between_range(@pricemin, @pricemax)
    end

    @markers = @offers.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
        infoWindow: { content: render_to_string(partial: "/offers/map_box", locals: { offer: offer }) }
      }
    end
    @categories = Offer.categories
  end
end
