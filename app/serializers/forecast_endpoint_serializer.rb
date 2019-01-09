
class ForecastEndpointSerializer

  include FastJsonapi::ObjectSerializer

  attribute :id

  attribute :current do |object|
    current = object.current.json
  end

  attribute :today do |object|
    today = object.today.json
  end

  attribute :forecast do |object|
    forecast = object.forecast
    ForecastSerializer.new(forecast)
  end

  attribute :location do |object|
    location = object.location.json
  end


end
