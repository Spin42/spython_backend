class Api::TokenFinderController < ApplicationController

  layout false

  respond_to :json

  def index
    respond_with @skin = Skin.where(params[:uid] => " "self.uid[0,6].upcase)
  end

  protected

    def skin_params
      params.require(:skin).permit({:token})
    end

end
