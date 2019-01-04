

class Gif

  attr_reader :url, :time, :summary, :copyright

  def initialize( day, url )
    @url     = url
    @day     = day
    @time    = day.time
    @summary = day.summary
    # @copyright = 2018       #hard coded, but I don't currently know how to handle date format
    @copyright = Date.now.year
  end









end
