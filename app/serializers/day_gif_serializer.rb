
class DayGifSerializer

  include FastJsonapi::ObjectSerializer

  attribute :id { 0 }

  attributes :time, :summary, :url

end
