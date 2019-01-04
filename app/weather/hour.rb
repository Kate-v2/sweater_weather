
class Hour

  def initialize( data )
    @data        = data
    @time        = data[:time]
    @icon        = data[:icon]
    @temperature = data[:temperature]
  end

end
