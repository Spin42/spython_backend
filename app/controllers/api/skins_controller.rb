class Api::SkinsController < ApplicationController

  layout false

  def create
    @skin = Skin.create!
  end

end
