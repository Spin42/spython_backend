class Api::StatisticsController < ApplicationController

  layout false

  def index
    @skin_count = Skin.count
    @recently_changed_skins = Skin.recently_changed(5).includes(:properties)

    respond_to do |format|
      format.json { render "index" }
    end
  end

end