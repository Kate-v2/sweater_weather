
class Location < ApplicationRecord

  # ASSUMPTION - only US States formatted City, State (no country)

  def self.make_location(location)
    make_city_state(location)
    valid  = valid_abbreviation?
    @state = location_tool.state_abbreviation(@state) unless valid
    new_location if @state
  end

  private

  def self.make_city_state(location)
    split   = location_tool.city_state(location)
    @city   = split[:city]
    @state  = split[:state]
  end

  def self.location_tool
    @_tool ||= UsaLocationTools.new
  end

  def self.valid_abbreviation?
    @state.size == 2 && location_tool.validate_state(@state)
  end

  def self.new_location
    Location.first_or_create(city: @city, state_short: @state)
  end

end
