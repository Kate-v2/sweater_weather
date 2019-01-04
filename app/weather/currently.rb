
class Currently

  attr_reader :time, :summary, :icon, :temperature, :feels_like

  def initialize( data )
    @data = data

    @time        = data[:time]      # funny format -> 1546498800
    @summary     = data[:summary]
    @icon        = data[:icon]

    @temperature = data[:temperature]           # do we want to round it here?
    @feels_like  = data[:apparentTemperature]   # ^^^ ?

    # These should probably come from the day summary
    # @humidity    = data[:humidity]
    # @visibility  = data[:visibility]
    # @uv_index    = data[:uvIndex]

    # I think these must come from a specific hour ?
    # @today_description
    # @tonight_description
  end

  private

    attr_reader :data

    # def today_prefix # ie: 15464 from 1546498800
    #   @time[0...-6]
    # end

    # Is translating the date presenter responsibility ?
    # def day_of_week
    #   # sun - sat --> 1 - 7
    #   today_prefix.last
    # end

end
