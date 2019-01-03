
module StubGeocodeDenver

  def stub_geocode_denver
    base  = 'https://maps.googleapis.com/maps/api/geocode/json'
    query = '?address=Denver,CO'
    key   = "&key=#{ENV['google_key']}"
    url   = base+query+key
    stub_request(:get, url).
      to_return(body: File.read("./spec/fixtures/api/v1/denver_geocode.json"))
  end


end
