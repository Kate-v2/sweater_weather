
class GoogleService

  def initialize(filter)
    @base_url = 'https://maps.googleapis.com/maps/api/geocode/json'
    @filter   = filter
    @target   = filter[:target]
  end

  def target_data
    get_json( format_query )
  end


  private

  def endpoints
    {
      address: "?address=#{location}"
    }
  end

  def target
    endpoints[@target]
  end

  def key_param
    "key=#{ENV['google_key']}"
  end

  def format_query
    "#{target}&#{key_param}"
  end

  def location
    @location ||= @filter[:location]  # we should validate that this is city,state somewhere ?
  end

  def get_json(url)
    response = location_connection.get( url )
    JSON.parse(response.body, symbolize_names: true)
  end

  def location_connection
    Faraday.new(url: @base_url)
  end

end
