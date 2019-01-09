
class ForecastEndpointSerializer

  include FastJsonapi::ObjectSerializer

  attribute :id

  attribute :current do |object|
    # current = object.current
    current = object.current.json
    # CurrentlySerializer.new(current)
  end

  attribute :today do |object|
    # today = object.today
    today = object.today.json
    # TodaySerializer.new(today)
  end

  attribute :forecast do |object|
    # forecast = object.forecast.hours
    forecast = object.forecast
    ForecastSerializer.new(forecast)
  end

  attribute :location do |object|
    location = object.location.json
    # location = object.location
    # LocationSerializer.new(location)
  end


end
