class Api::SkinsController < ApplicationController

  layout false
  respond_to :json

  before_filter :set_format

  def index
    @skins = Skin.all
  end

  def create
    @skin = Skin.create!
    PropertyCreator.new(@skin).create_properties!(params[:properties]) if params[:properties].present?
    render 'show'
  end

  def show
    @skin = Skin.find(params[:id])
  end

  protected

  def set_format
    request.format = :json
  end

end
