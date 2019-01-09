
class GifHelper

  include ModID

  def initialize( location )
    @forecast = ForecastHelper.new(location).forecast_endpoint
    # This object is overkill, we'd probably want to refactor
    @days = @forecast.forecast.days
  end

  def daily_gifs
    make_gifs.map { |g| g.json }
  end

  private

  def make_gifs
    @days.map { |day|
      @_term =  day.summary
      url    = gif_url
      Gif.new(day, url)
    }
  end

  def gif_url
    get_gif[:url]
  end

  def get_gif
    raw = get_gifs
    raw[:data].first
  end

  def get_gifs
    target = { target: :search, term: @_term }
    GiphyService.new( target ).target_data
  end

end
