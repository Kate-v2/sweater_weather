
class ForecastHelper

  def initialize( location )
    @location = location
    get_location
  end

  def forecast_endpoint
    ForecastEndpoint.new( current, today, forecast, location )
  end

  # make private, update test
  def get_coordinates
    location.pair
  end

  private

  # --- Forecast ---

  def current
    @current ||= Currently.new( @forecast[:currently] )
  end

  def today
    @today ||= Today.new( @forecast[:daily][1] )
  end

  def forecast
    @forecast ||= Forecast.new( @forecast[:daily] )
  end

  # NOTE - forecast will not include null values does not include key if no data
  # ==== KEYS are NOT always the same! ====
  def get_forecast
    @forecast ||= DarkSkyService.new( forecast_target )
  end

  def forecast_target
    target = { target: :forecast, location: get_coordinates }
  end

  # --- Location ----

  def location
    @location ||= Coordinates.new( @google )
  end

  def get_location
    @google ||= GoogleService.new( location_target ).target_data
  end

  def location_target
    target = { target: :address, location: @location }
  end



end
