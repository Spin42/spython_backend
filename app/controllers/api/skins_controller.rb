class Api::SkinsController < ApplicationController

  layout false

  respond_to :json

  def index
    respond_with @skins = Skin.all
  end

  def create
    respond_with @skin = Skin.create!
  end

  def show
    respond_with @skin = Skin.find(params[:id])
  end

end
