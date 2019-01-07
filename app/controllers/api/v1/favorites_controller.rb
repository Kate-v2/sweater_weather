
class Api::V1::FavoritesController < ApplicationController


  def create
    input = new_favorite
    @user = User.find_by_token( input[:api_key] )
    Location.make_location( input[:location] )
    # No Return Render
    @user ? (head 201) : (head 401)
  end

    # make a locations table ?
    # can have (states) long_name, short_name
    # @location = Location.where(city: , s)first_or_create("")
    # @user.favorites.create()




  private

  def new_favorite
    input = params.dup
    input.slice!(:location, :api_key)
    return input
  end



end
