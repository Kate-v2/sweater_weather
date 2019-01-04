
class ForecastHelper

  def initialize( location )
    @location = location
  end

  def forecast_endpoint
    ForecastEndpoint.new( overview, details, forecast )
  end

  # make private, update test
  def get_coordinates
    Coordinates.new( get_location ).pair
  end


  private

  # --- Forecast ---

  def overview
    Overview.new( @forecast )
  end

  def details
    Details.new( @forecast )
  end

  def forecast
    Forecast.new( @forecast )
  end

  def get_forecast
    @forecast ||= DarkSkyService.new( forecast_target )
  end

  def forecast_target
    target = { target: :forecast, location: get_coordinates }
  end

  # --- Location ----

  def get_location
    GoogleService.new( location_target ).target_data
  end

  def location_target
    target = { target: :address, location: @location }
  end



end
