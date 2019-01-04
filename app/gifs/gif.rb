

class Gif

  attr_reader :url, :time, :summary

  def initialize( day, url )
    @url     = url
    @day     = day
    @time    = day.time
    @summary = day.summary
  end









end
