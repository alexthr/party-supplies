class SearchController < ApplicationController
  def search
    if params[:q]
      @offers = Offer.where("title ILIKE ? OR category ILIKE ? OR location ILIKE ? OR description ILIKE ?",
        "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%").all.order("created_at DESC")
      if @offers.first.nil?
        @offers = Offer.joins(:user).where("username ILIKE ?", "%#{params[:q]}%").all.order("created_at DESC")
      end
    else
      @offers = Offer.all.order("created_at DESC")
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
  end
end
