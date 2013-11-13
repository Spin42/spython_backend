class Api::SkinsController < ApplicationController

  layout false

  def index
    render :json => @skins = Skin.all
  end

  def create
    @skin = Skin.create!
    PropertyCreator.new(@skin).create_properties!(skin_params[:properties]) if skin_params[:properties].present?
    render :json => @skin
  end

  def show
    render :json => @skin = Skin.find(params[:id])
  end

  protected

    def skin_params
      params.require(:skin).permit({:properties => [:key, :value, :type]})
    end

end
