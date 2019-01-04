
class DailyGifSerializer

  include FastJsonapi::ObjectSerializer

  attribute :id

  attribute :gif do |gif|
    DayGifSerializer.new(gif)
  end


end
