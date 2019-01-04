
class Api::V1::GifsController < ApplicationController

  def index
    location = params[:location]
    helper   = GifHelper.new(location)
    binding.pry
  end





end
