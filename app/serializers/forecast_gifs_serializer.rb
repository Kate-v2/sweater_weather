
class ForecastGifsSerializer

  include FastJsonapi::ObjectSerializer

  attribute :id

  attribute :dialy_forecast do |arr|
    gifs = arr.collection
    DailyGifSerializer.new(gifs)
  end

  attribute :copyright { Date.today.year }




end
