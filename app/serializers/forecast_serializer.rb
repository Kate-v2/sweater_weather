
class ForecastSerializer

  include FastJsonapi::ObjectSerializer

  attributes  :id

  attribute :hourly do |object|
    hours = object.hours
    HourSerializer.new(hours)
  end

  attribute :days do |object|
    days = object.days
    DaySerializer.new(days)
  end



end
