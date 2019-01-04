

class ForecastEndpoint

  attr_reader :current, :today, :forecast, :location

  def initialize(current, today, forecast, location)
    @current  = current
    @today    = today
    @forecast = forecast
    @location = location
  end


end
