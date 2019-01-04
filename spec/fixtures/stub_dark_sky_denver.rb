
module StubDarkSkyDenver

  def stub_dark_sky_denver_path
    "./spec/fixtures/api/v1/denver_dark_sky.json"
  end

  def stub_dark_sky_denver
    base   = 'https://api.darksky.net/'
    query  = 'forecast/'
    key    = "#{ENV['dark_sky_key']}/"
    coords = '39.7392358,-104.990251'
    url   = base + query + key + coords
    stub_request(:get, url).
      to_return(body: File.read(stub_dark_sky_denver_path))
  end


end
