

class Today

  attr_reader :summary, :icon, :low, :high, :humidity, :visibility, :uv_index

  def initialize( data )
    @data = data

    @summary = data[:summary]
    @icon    = data[:icon]

    @low        = data[:temperatureLow]
    @high       = data[:temperatureHigh]
    # @feels_low  = data[:apparentTemperatureLow]
    # @feels_high = data[:apparentTemperatureHigh]

    @humidity   = data[:humidity]
    @visibility = data[:visibility]
    @uv_index   = data[:uvIndex]
    
    # morning & night descriptions must come from hourly ?
  end


  private

  attr_reader :data

end
