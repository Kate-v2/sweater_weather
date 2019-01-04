
class DailyGifSerializer

  include FastJsonapi::ObjectSerializer

  attribute :id

  attribute :dialy_forecast do |gif|
    DayGifSerializer.new(gif)
  end

  attribute :copyright do
    Date.today.year
  end




end
