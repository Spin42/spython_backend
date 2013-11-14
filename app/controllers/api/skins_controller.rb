class Api::SkinsController < ApplicationController

  layout false

  respond_to :json

  def index
    respond_with @skins = Skin.all
  end

  def create
    @skin = Skin.create!
    PropertyCreator.new(@skin).create_properties!(skin_params[:properties]) if skin_params[:properties].present?

    respond_with @skin do |format|
      format.json { render "show" }
    end
  end

  def show
    respond_with @skin = Skin.find(params[:id], :include => :properties)
  end

  protected

    def skin_params
      params.require(:skin).permit({:properties => [:key, :value, :type, :unit]})
    end

end
