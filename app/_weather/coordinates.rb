
class Coordinates

  include ModID

  attr_reader :city, :state, :country

  def initialize(raw)
    @data        = raw[:results].first
    @coordinates = @data[:geometry][:location]
    @location    = @data[:address_components]

    # make this more dynamic --> dig ?
    @city    = @location[0]
    # @county  = @location[1]
    @state   = @location[2]
    @country = @location[3]
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

  # These can be left as hashes
  # def city #   @city[:long_name] # end
  # def state_long #   @state[:long_name] # end
  # def state_short #   @state[:short_name] # end
  # def country_long #   @county[:long_name] # end
  # def country_short #   @county[:long_name] # end


  private

  def lat
    @coordinates[:lat]
  end

  def lng
    @coordinates[:lng]
  end

end
