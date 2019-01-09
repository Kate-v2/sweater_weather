
class Location < ApplicationRecord

  validates_presence_of :city, :state_short, :coordinates

  has_many :favorites
  has_many :users, through: :favorites

  # Location should be deleted if it has no favorites/users

  # ASSUMPTION - only US States formatted City, State (no country)
  # If I only store coordinate, I can always have a location (anywhere)
  # HOWEVER, favorites#index needs to display a location string
  # ---> which would be another API call there
  # --> and with many favorites that endpoint would take a long time

  def self.new_or_existing_location(location)
    make_city_state_pair(location)
    short = location_tool.get_short_state(@state)
    pair  = "#{@city},#{short}"
    if short
      new_location(short) if @coordinates = get_coordinates(pair)
    end
  end


  private

  def self.get_coordinates(location)
    raw    = get_geocode(location)
    pair   = raw[:results].first[:geometry][:location]
    coords = pair.values.join(",")
  end

  def self.get_geocode(location)
    target = { target: :address, location: location }
    raw = GoogleService.new(target).target_data
  end


  def self.make_city_state_pair(location)
    split   = location_tool.city_state(location)
    @city   = split[:city]
    @state  = split[:state]
  end

  def self.location_tool
    @_tool ||= USALocationTools.new
  end

  def self.new_location(short)
    Location.first_or_create(city: @city, state_short: short, coordinates: @coordinates)
  end

end
