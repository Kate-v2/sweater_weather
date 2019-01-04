
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
    GiphyService.new( daily_gif_target ).target_data
  end

  def daily_gif_target
    target = { target: :search, term: @_term }
  end

end


# {
#   data: {
#     daily_forecasts: [
#       {
#         time: "1546498800",
#         summary: "Mostly sunny in the morning.",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "1546585200",
#         summary: "Partly cloudy in the evening.",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "1546671600",
#         summary: "Snowy.",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "1546758000",
#         summary: "Firenado",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "1546844400",
#         summary: "Corgis because I cant think of other weather",
#         url: "<GIPHY_URL_GOES_HERE>"
#       }
#     ]
#   }
#   copyright: "2018"
# }
