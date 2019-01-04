
class ForecastGifsSerializer

  include FastJsonapi::ObjectSerializer

  attribute :id

  attribute :daily_forecast do |arr|
    gifs = arr.collection
    DailyGifSerializer.new(gifs)
  end

  attribute :copyright { Date.today.year }




end
