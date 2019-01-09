
class ApplicationController < ActionController::Base

  def user_by_token
    @user ||= User.find_by_token( params[:api_key])
  end

  def unauth(view = nil)
    view ? 401 : (head 401)
  end

  def creation(view = nil)
    view ? 201 : (head 201)
  end

  def ok(view = nil)
    view ? 200 : (head 200)
  end

  def no_content(view = nil)
    view ? 204 : (head 204)
  end



end
