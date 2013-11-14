class Api::TokensController < ApplicationController
  layout false
  respond_to :json

  def show
    @skin = Skin.where(token: params[:id]).first
  end
end
