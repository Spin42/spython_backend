class Api::PropertiesController < ApplicationController

  layout false

  def create
    @skin = Skin.find(params[:skin_id])
    @property = Property.new(property_params)
    @property.enrichable = @skin

    if @property.save
      render :json => @property
    else
      render :json => {:errors => @property.errors.full_messages }
  end

  private

    def property_params
      params.require(:property).permit(:key, :value, :type)
    end

end
