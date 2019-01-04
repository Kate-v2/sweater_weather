
class Api::V1::GifsController < ApplicationController

  def index
    location = params[:location]
    gifs   = GifHelper.new(location).daily_gifs
    render json: ForecastGifsSerializer.new(gifs)
  end





end
