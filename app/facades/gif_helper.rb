
class GifHelper

  def initialize( location )
    @forecast = ForecastHelper.new(location).forecast_endpoint
    # This object is overkill, we'd probably want to refactor
    # could use the API endpoint ?
    @daily = @forecast.forecast.days
  end

  # I need to get this into forecast, under Day?



end
