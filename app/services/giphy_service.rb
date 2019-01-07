
class GiphyService

  # make a simple_service.rb class for these to inherit from

  def initialize(filter)
    @base_url = "https://api.giphy.com"
    @filter   = filter
    @target   = filter[:target]
  end

  def target_data
    get_json( format_query )
  end


  private

  def endpoint
    {
      search: '/v1/gifs/search'
    }
  end

  def target
    endpoint[@target]
  end

  def term
    @term ||= @filter[:term]
  end


  def format_query
    [
      target,
      key_param    = "?api_key=#{ ENV['giphy_key'] }",
      query_term   = "&q=#{ term }",
      limit        = "&limit=8",
      offset       = "&offset=0",
      rating       = "&rating=G",
      lang         = "&lang=en"
    ].join
  end

  def get_json(url)
    response = giphy_connection.get( url )
    JSON.parse(response.body, symbolize_names: true)
  end

  def giphy_connection
    Faraday.new(url: @base_url)
  end

end
