
class DailyGifSerializer

  include FastJsonapi::ObjectSerializer

  attribute :id

  attribute :dialy_forecast do |gif|
    DayGifSerializer.new(gif)
  end


end
