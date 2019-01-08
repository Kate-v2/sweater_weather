
module StubFavorites

  def url(coords)
    base   = 'https://api.darksky.net/'
    query  = 'forecast/'
    key    = "#{ENV['dark_sky_key']}/"
    coords =  "#{coords}"
    url   = base + query + key + coords
  end


  def stub_favorite_denver_path
    './spec/fixtures/api/v1/favorites/favorite_denver.json'
  end

  def stub_favorite_denver
    coords = '39.7392358,-104.990251'
    stub_request(:get, url(coords) ).
      to_return(body: File.read( stub_favorite_denver_path ) )
  end


  def stub_favorite_golden_path
    './spec/fixtures/api/v1/favorites/favorite_golden.json'
  end

  def stub_favorite_golden
    coords = '39.755543,-105.2210997'
    stub_request(:get, url(coords) ).
      to_return(body: File.read( stub_favorite_golden_path ) )
  end


end
