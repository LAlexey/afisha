class Admin::PlacesController < Admin::BaseController
  expose(:place)

  def index
    @places = Place.page(params[:page]).per(10).all
  end
end