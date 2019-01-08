
class Api::V1::FavoritesController < ApplicationController

  before_action :user_by_token

  def index
    favorites = @user.favorites
    render json UserFavoritesSerializer.new(favorites)
  end


  def create
    new_favorite
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
    # @input ||= params.dup.slice!(:location, :api_key)
    @input ||= params.dup.slice!(:location)
  end



end
