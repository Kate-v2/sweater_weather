

class GiphyGifRaw

  attr_reader :url

  def initialize( data )
    binding.pry
    @data = data[:data]
    @gif  = @data.first
    @url  = @gif[:url]
  end

end
