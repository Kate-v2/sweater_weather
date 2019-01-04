

class GiphyGifRaw

  attr_reader :url

  def initialize( data )
    @data = data[:data]
    @gif  = @data.first
    @url  = @gif[:url]
  end

end
