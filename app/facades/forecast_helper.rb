
class ForecastHelper

  def initialize( location )
    @city_state = location
  end

  def forecast_for_gif
    forecast
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
    target = { target: :forecast, location: get_coordinates }
    @_darksky ||= DarkSkyService.new( target ).target_data
  end


  # --- Location ----

  def get_coordinates
    location.pair
  end

  def location
    @_location_obj ||= Coordinates.new( get_location )
  end

  def get_location
    target = { target: :address, location: @city_state }
    @_google ||= GoogleService.new( target ).target_data
  end


end
