
class ForecastHelper

  def initialize( location )
    @location = location
  end


  def get_coordinates
    Coordinates.new( get_location ).pair
  end


  private

  def get_location
    GoogleService.new( location_target ).target_data
  end

  def location_target
    target = { target: :address, location: @location }
  end



end
