
class Api::V1::FavoritesController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :user_by_token

  def index
    if @user && !@user.favorites.empty?
      favorites = FavoritesFacade.new(@user.favorites).current_weathers
      render json: UserFavoritesSerializer.new(favorites), status: ok(true)
    else
      unauth
    end
  end

  def create
    new_favorite
    @user ? make_new_favorite : unauth
  end

  def destroy
      if @user && @fav = @user.specific_favorite(params[:location])
        favorite = FavoritesFacade.new([@fav]).current_weathers
        @fav.delete
        no_content
        # render json: UserFavoritesSerializer.new(favorite), status: ok(true)
        # redirect_to get: :index  #--> this gives 302 and html redirect
      else
        unauth
      end
  end


  private

  def make_new_favorite
    location = Location.new_or_existing_location( @input[:location] )
    favorite = @user.favorites.create(location: location)
    # No Return Render
    favorite.id ? creation : unauth
  end

  def new_favorite
    # This is less necessary now that api_key is moved to ApplicationController
    # @input ||= params.dup.slice!(:location, :api_key)
    @input ||= params.dup.slice!(:location)
  end



end
