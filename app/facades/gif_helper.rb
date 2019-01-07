
class GifHelper

  def initialize( location )
    @forecast = ForecastHelper.new(location).forecast_endpoint
    # This object is overkill, we'd probably want to refactor
    # could use the API endpoint ?
    @days = @forecast.forecast.days
  end

  # I need to get this into forecast, under Day?

  # use summary field for each day

  def daily_gifs
    ForecastGifs.new( make_gifs )
  end

  private

  def make_gifs
    @days.map { |day|
      @_term =  day.summary
      url = gif_url
      Gif.new(day, url)
    }
  end

  def gif_url
    get_gif.url
  end

  def get_gif
    GiphyGifRaw.new( get_gifs )
  end

  def get_gifs
    target = { target: :search, term: @_term }
    GiphyService.new( target ).target_data
  end


end
