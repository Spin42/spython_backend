class Api::SkinsController < ApplicationController

  layout false
  respond_to :json

  before_filter :set_format

  def index
    @skins = Skin.all
  end

  def create
    @skin = Skin.create!
  end

  protected

  def set_format
    request.format = :json
  end

end
