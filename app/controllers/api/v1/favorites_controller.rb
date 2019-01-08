
class Api::V1::FavoritesController < ApplicationController

  before_action :user_by_token

  def index
    if @user && !@user.favorites.empty?
      favorites = FavoritesFacade.new(@user.favorites).current_weathers
      render json: UserFavoritesSerializer.new(favorites), status: 200
    else
      head 401
    end
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
    # This is less necessary now that api_key is moved to ApplicationController
    # @input ||= params.dup.slice!(:location, :api_key)
    @input ||= params.dup.slice!(:location)
  end



end
