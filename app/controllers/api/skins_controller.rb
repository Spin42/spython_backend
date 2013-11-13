class Api::SkinsController < ApplicationController

  layout false

  def index
    @skins = Skin.all
  end

  def create
    @skin = Skin.create!
  end

end
