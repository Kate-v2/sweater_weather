
class ForecastHelper

  def initialize( location )
    @city_state = location
  end

  def forecast_endpoint
    ForecastEndpoint.new( current, today, forecast, location )
  end

  private

  # --- Forecast ---

  def current
    @_current ||= Currently.new( get_forecast[:currently] )
  end

  def today
    @_today ||= Today.new( get_forecast[:daily][:data][1] )
  end

  def forecast
    @_forecast ||= Forecast.new( get_forecast )
  end

  # NOTE - forecast will not include null values does not include key if no data
  # ==== KEYS are NOT always the same! ====
  def get_forecast
    @_darksky ||= DarkSkyService.new( forecast_target ).target_data
  end

  def forecast_target
    target = { target: :forecast, location: get_coordinates }
  end


  # --- Location ----

  def get_coordinates
    location.pair
  end

  def location
    @_location_obj ||= Coordinates.new( get_location )
  end

  def get_location
    @_google ||= GoogleService.new( location_target ).target_data
  end

  def location_target
    target = { target: :address, location: @city_state }
  end



end
