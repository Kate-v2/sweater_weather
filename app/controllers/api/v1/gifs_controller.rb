
class Api::V1::GifsController < ApplicationController

  def index
    location = params[:location]
    helper   = GifHelper.new(location)
    gifs     = helper.daily_gifs
    binding.pry
    render json: DailyGifSerializer.new(gifs)
  end





end
