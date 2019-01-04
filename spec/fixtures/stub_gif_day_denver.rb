
module StubGifDayDenver

  def stub_gif_day_denver
    url = [
      base  = 'https://api.giphy.com/v1/gifs/',
      endpoint = '/search',
      key      = "?api_key=#{ENV['giphy_key']}",
      query    = "&q=Clear throughout the day.",
      limit    = "&limit=8",
      offset   = "&offset=0",
      rating   = "&rating=G",
      lang     = "&lang=en"
    ].join
    binding.pry
    stub_request(:get, url).
      to_return(body: File.read("./spec/fixtures/api/v1/denver_clear-day_gif.json"))
  end


end
# search?api_key=vYW33vk0PLoBDCvjgzTCfe75cGudOk5i
# &q=Clear throughout the day.
# &limit=8&offset=0&rating=G&lang=en
