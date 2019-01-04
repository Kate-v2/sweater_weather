
module StubGifDayDenver

  def url(term)
    url = [
      base     = 'https://api.giphy.com/v1/gifs/',
      endpoint = '/search',
      key      = "?api_key=#{ENV['giphy_key']}",
      query    = "&q=#{ term }",
      limit    = "&limit=8",
      offset   = "&offset=0",
      rating   = "&rating=G",
      lang     = "&lang=en"
    ].join
  end


  def stub_gif_day1_denver_path
    "./spec/fixtures/api/v1/gif_days/denver_day1_gif.json"
  end

  def stub_gif_day1_denver
    term = "Clear throughout the day."
    stub_request(:get, url(term)).
      to_return(body: File.read(stub_gif_day1_denver_path))
  end



  def stub_gif_day2_denver_path
    # USING DAY 1 DATA
    stub_gif_day1_denver_path
  end

  def stub_gif_day2_denver
    term = "Clear throughout the day."
    stub_request(:get, url(term)).
      to_return(body: File.read(stub_gif_day2_denver_path))
  end



  def stub_gif_day3_denver_path
    "./spec/fixtures/api/v1/gif_days/denver_day3_gif.json"
  end

  def stub_gif_day3_denver
    term = "Mostly cloudy starting in the afternoon."
    stub_request(:get, url(term)).
      to_return(body: File.read(stub_gif_day3_denver_path))
  end



  def stub_gif_day4_denver_path
    "./spec/fixtures/api/v1/gif_days/denver_day4_gif.json"
  end

  def stub_gif_day4_denver
    term = "Partly cloudy throughout the day."
    stub_request(:get, url(term)).
      to_return(body: File.read(stub_gif_day4_denver_path))
  end



  def stub_gif_day5_denver_path
    "./spec/fixtures/api/v1/gif_days/denver_day5_gif.json"
  end

  def stub_gif_day5_denver
    term = "Mostly cloudy throughout the day."
    stub_request(:get, url(term)).
      to_return(body: File.read(stub_gif_day5_denver_path))
  end



  def stub_gif_day6_denver_path
    "./spec/fixtures/api/v1/gif_days/denver_day6_gif.json"
  end

  def stub_gif_day6_denver
    term = "Mostly cloudy until evening."
    stub_request(:get, url(term)).
      to_return(body: File.read(stub_gif_day6_denver_path))
  end



  def stub_gif_day7_denver_path
    # USING DAY 5 DATA
    stub_gif_day5_denver_path
  end

  def stub_gif_day7_denver
    term = "Mostly cloudy throughout the day."
    stub_request(:get, url(term)).
      to_return(body: File.read(stub_gif_day7_denver_path))
  end



  def stub_gif_day8_denver_path
    # USING DAY 3 DATA
    stub_gif_day3_denver_path
  end

  def stub_gif_day8_denver
    term = "Mostly cloudy starting in the afternoon."
    stub_request(:get, url(term)).
      to_return(body: File.read(stub_gif_day8_denver_path))
  end



end
