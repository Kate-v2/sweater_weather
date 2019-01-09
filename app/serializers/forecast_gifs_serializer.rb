
class ForecastGifsSerializer

  include FastJsonapi::ObjectSerializer

  attributes :id, :daily_gifs

  attribute :copyright { Date.today.year }




end
