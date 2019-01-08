
class Api::V1::FavoritesController < ApplicationController


  def create
    new_favorite
    @user = User.find_by_token( @input[:api_key] )
    @user ? make_new_favorite : (head 401)
  end


  private

  def make_new_favorite
    location = Location.new_or_existing_location( @input[:location] )
    favorite = @user.favorites.create(location: location)
    # No Return Render
    favorite.id ? (head 201) : (head 401)
  end

  def new_favorite
    @input ||= params.dup.slice!(:location, :api_key)
  end



end
