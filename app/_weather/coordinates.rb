
class Coordinates

  include ModID

  def initialize(raw)
    @data        = raw[:results].first
    @coordinates = @data[:geometry][:location]
    @location    = @data[:address_components]
  end

  def pair
    "#{lat},#{lng}"
  end

  def json
    {
      city:    city,
      state:   state,
      country: country
    }
  end

  private

  def lat
    @coordinates[:lat]
  end

  def lng
    @coordinates[:lng]
  end

  # These are accessible to serializer even though they're private ... ?

  # make this more dynamic --> dig ?
  def city
    c = @location[0]
    c.delete(:types)
    c
  end

  # @county  = @location[1]

  def state
    s = @location[2]
    s.delete(:types)
    s
  end

  def country
    c = @location[3]
    c.delete(:types)
    c
  end




end
