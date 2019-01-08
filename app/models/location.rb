
class Location < ApplicationRecord

  # has_many :favorites

  # ASSUMPTION - only US States formatted City, State (no country)

  def self.new_or_existing_location(location)
    make_city_state_pair(location)
    short = location_tool.get_short_state(@state)
    new_location(short) if short
  end


  private

  def self.make_city_state_pair(location)
    split   = location_tool.city_state(location)
    @city   = split[:city]
    @state  = split[:state]
  end

  def self.location_tool
    @_tool ||= USALocationTools.new
  end

  def self.new_location(short)
    Location.first_or_create(city: @city, state_short: short)
  end

end
