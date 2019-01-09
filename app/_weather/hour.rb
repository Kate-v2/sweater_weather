
class Hour

  include ModID

  attr_reader :time, :icon, :temperature

  def initialize( data )
    @data        = data
    @time        = data[:time]
    @icon        = data[:icon]
    @temperature = data[:temperature]
  end

  def json
    {
      time:        time,
      icon:        icon,
      temperature: temperature
    }
  end

end
