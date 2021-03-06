
class Api::V1::ForecastsController < ApplicationController

  def index
    forecast   = ForecastHelper.new(location).forecast_endpoint
    render json: ForecastEndpointSerializer.new(forecast), status: ok(true)
  end



  private

  def location
    location = params[:location] || request.location.city
  end

end
