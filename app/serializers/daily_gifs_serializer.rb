
class DailyGifsSerializer

  include FastJsonapi::ObjectSerializer

  attribute :id

  attribute :dialy_forecast do |gif|
    DailyGifSerializer.new(gif)
  end

  attribute :copyright { Date.today.year }




end
