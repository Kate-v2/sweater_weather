
class Day

  attr_reader :time, :icon, :summary, :precip_probability, :precip_type, :low, :high

  def initialize( data )
    @data = data

    @time               = data[:time]
    @icon               = data[:icon]
    @summary            = data[:summary]
    @precip_probability = data[:precipProbability]
    @precip_type        = data[:precipType]   # may not be included if no precip
    @low                = data[:temperatureLow]
    @high               = data[:temperatureHigh]
  end

end
