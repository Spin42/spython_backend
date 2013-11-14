class Api::PropertiesDictionariesController < ApplicationController

  layout false

  respond_to :json

  def show
    render :json => {properties: Property::AVAILABLE_PROPERTIES}
  end

end