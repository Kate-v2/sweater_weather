
class ForecastEndpointSerializer

  include FastJsonapi::ObjectSerializer

  attribute :id

  attribute :current do |object|
    current = object.current
    CurrentlySerializer.new(current)
  end

  attribute :today do |object|
    today = object.today
    TodaySerializer.new(today)
  end

  attribute :forecast do |object|
    forecast = object.forecast
    ForecastSerializer.new(forecast)
  end

  attribute :location do |object|
    location = object.location
    LocationSerializer.new(location)
  end


end
