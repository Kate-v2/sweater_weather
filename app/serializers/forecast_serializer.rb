
class ForecastSerializer

  include FastJsonapi::ObjectSerializer

  attributes  :id

  attribute :hourly do |object|
    hours = object.json_hours
  end

  attribute :days do |object|
    days = object.json_days
  end



end
