
class DarkSkyService

  # make a simple_service.rb class for these to inherit from

  def initialize(filter)
    @base_url = 'https://api.darksky.net/'
    @filter   = filter
    @target   = filter[:target]
  end


  def target_data
    get_json( format_query )
  end


  private

  def target
    endpoints[@target]
  end

  def endpoints
    {
      forecast: 'forecast/'
    }
  end

  def key_in_url
    "#{ENV['dark_sky_key']}/"
  end

  def coordinates
    "#{@filter[:location]}"
  end

  def format_query
    "#{ target }#{ key_in_url }#{ coordinates }"
  end

  def get_json(url)
    response = forecast_connection.get( url )
    JSON.parse(response.body, symbolize_names: true)
  end

  def forecast_connection
    Faraday.new(url: @base_url)
  end

end
