
class Api::V1::GifsController < ApplicationController

  def index
    location = params[:location]
    helper   = GifHelper.new(location)
    gifs     = helper.daily_gifs
    render json: DailyGifSerializer.new(gifs)
  end





end
