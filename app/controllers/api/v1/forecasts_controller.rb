
class Api::V1::ForecastsController < ApplicationController

  def index
    helper   = ForecastHelper.new(location)
    forecast = helper.forecast_endpoint
    # TO DO - make serializer(s)
    # render json forecast
    binding.pry
  end




  private

  def location
    location = params[:location] || request.location.city
  end

end
