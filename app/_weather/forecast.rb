
# ASSUMPTION - we do not need the minutely forecast

class Forecast

  include ModID

  def initialize( data )
    @data       = data
    @daily      = data[:daily]
    @daily_set  = @daily[:data]
    @hourly     = data[:hourly]
    @hourly_set = @hourly[:data]
  end

  def hours # ~ 49 hours worth of data
    @hours ||= @hourly_set.map { |hour| Hour.new(hour) }
  end
  # Might want to filter by beyond current time

  def days # Includes Yesterday  -- 8 days of data
    @days ||= @daily_set.map { |day| Day.new(day) }
  end


  def json_hours
    hours.map { |h| h.json }
  end

  def json_days
     days.map { |d| d.json  }
   end

  private

  attr_reader :hourly, :daily


end
