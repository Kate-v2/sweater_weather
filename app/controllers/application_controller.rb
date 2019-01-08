
class ApplicationController < ActionController::Base

  def user_by_token
    @user ||= User.find_by_token( params[:api_key])
  end


end
