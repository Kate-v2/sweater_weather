

class Gif

  attr_reader :url, :time, :summary, :copyright

  def initialize( day, url )
    @url       = url
    @day       = day
    @time      = day.time
    @summary   = day.summary
    # this is for the collection, not each
    # @copyright = Date.today.year
  end









end
