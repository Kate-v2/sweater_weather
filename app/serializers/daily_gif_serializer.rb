
class DailyGifSerializer

  include FastJsonapi::ObjectSerializer

  attribute :id

  attributes :time, :summary, :url

end
