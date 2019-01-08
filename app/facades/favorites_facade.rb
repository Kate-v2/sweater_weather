
class FavoritesFacade

  def initialize( favorites )
    @favorites = favorites
  end

  def current_weathers
    @favorites.map { |fav|
      loco   = fav.joint_location
      coords = fav.location.coordinates
      weather = make_current_weather( coords )
      Fav.new(loco, weather)
    }
  end

  def make_current_weather(location)
    raw = get_current_weather(location)
    Currently.new( raw[:currently] )
  end

  def get_current_weather(location)
    target = { target: :forecast, location: location }
    DarkSkyService.new( target ).target_data
  end


  Fav = Struct.new(:location, :current_weather) do
    include ModID
  end


end
