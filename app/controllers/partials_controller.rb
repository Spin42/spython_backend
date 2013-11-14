class PartialsController < ApplicationController

  def show
    render params[:id]
  end

end