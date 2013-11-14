class Api::PropertiesController < ApplicationController

  layout false

  respond_to :json

  def create
    @skin = Skin.find(params[:skin_id])
    @property = Property.new(property_params)
    @property.enrichable = @skin

    respond_to do |format|
      format.json do
        if @property.save
          render "create"
        else
          render :json => {:errors => @property.errors.full_messages }
        end
      end
    end


  end

  private

    def property_params
      params.require(:property).permit(:key, :value, :type)
    end

end
