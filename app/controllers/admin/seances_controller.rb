class Admin::SeancesController < Admin::BaseController
  def index
    @seances = Seance.all
  end
end
