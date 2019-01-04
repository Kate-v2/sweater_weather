
class GiphyService

  # make a simple_service.rb class for these to inherit from

  def initialize(filter)
    @base_url = 'https://api.giphy.com/v1/gifs/'
    @filter   = filter
    @target   = filter[:target]
  end


  def target_data
    get_json( format_query )
  end


  private

  def endpoint
    {
      search: '/search'
    }
  end

  def target
    endpoint[@target]
  end

  def key_param
    "?api_key=#{ ENV['giphy_key'] }"
  end

  def query_term
    "&q=#{ term.gsub(" ", "%20") }"
  end

  def term
    @term ||= @filter[:term]
  end

  def limit
    "&limit=8"
  end

  def offset
    "&offset=0"
  end

  def rating
    "&rating=G"
  end

  def lang
    "&lang=en"
  end

  def format_query
    [
      target,
      key_param,
      query_term,
      limit,
      rating,
      lang
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
