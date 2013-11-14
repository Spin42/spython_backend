class Api::PropertiesDictionariesController < ApplicationController

  layout false

  respond_to :json

  def show
    @available_properties = Property::AVAILABLE_PROPERTIES
  end
end