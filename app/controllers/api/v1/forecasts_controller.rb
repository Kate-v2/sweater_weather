
class Api::V1::ForecastsController < ApplicationController

  def index
    coords = ForecastHelper.new(location).get_coordinates

    binding.pry
  end




  private

  def location
    location = params[:location] || request.location.city
  end

end
