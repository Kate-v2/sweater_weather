
class Day

  include ModID

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

  def json
    {
      time:               time,
      icon:               icon,
      summary:            summary,
      precip_probability: precip_probability,
      precip_type:        precip_type,
      low:                low,
      high:               high
    }
  end

end
