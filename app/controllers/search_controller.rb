class SearchController < ApplicationController
  def search
    if params.keys.include?("query")
      session[:query_param] = params[:query]
      session[:category_param] = ""
    elsif params.keys.include?("category")
      session[:category_param] = params[:category]
    end

    if session[:query_param].present?
      @offers = Offer.search_offers("#{session[:query_param]}")
    else
      @offers = Offer.all.order("created_at DESC")
    end

    if session[:category_param].present?
        @offers = Offer.where("category LIKE ?", session[:category_param])
    end

    if params[:pricemax].to_i > 0 && params[:pricemin].to_i > 0
      @offers = @offers.where("price >= ? AND price <= ?", params[:pricemin].to_i, params[:pricemax].to_i)
    elsif params[:pricemin].to_i >0
      @offers = @offers.where("price >= ?", params[:pricemin].to_i)
    elsif params[:pricemax].to_i > 0 && params[:pricemin] == ""
      @offers = @offers.where("price <= ?", params[:pricemax].to_i)
    end

    @markers = @offers.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
        infoWindow: { content: render_to_string(partial: "/offers/map_box", locals: { offer: offer }) },
        picture: {
        "url": view_context.image_path("logo.png"),
        "width":  50,
        "height": 45 }
      }
    end
    @categories = Offer.categories
  end
end
