
require './spec/fixtures/stub_geocode_denver'
require './spec/fixtures/stub_dark_sky_denver'
require './spec/fixtures/stub_gif_day_denver'
# require './spec/fixtures/stub_favorites'

module StubAll

  # include StubFavorites
  include StubGeocodeDenver
  include StubDarkSkyDenver
  include StubGifDayDenver
  # include StubFavorites
  # ^^^ if I keep this, then giphy tests break
  # ^^^ if I remove it (or move it anywhere above, favorite tests break)

end
