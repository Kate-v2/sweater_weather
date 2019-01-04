
class Coordinates

  def initialize(raw)
    @raw  = raw
    @location = raw[:results].first[:geometry][:location]
  end

  def pair
    "#{lat},#{lng}"
  end

  private

  def lat
    @location[:lat]
  end

  def lng
    @location[:lng]
  end

end
