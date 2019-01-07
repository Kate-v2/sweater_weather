

class Api::V1::SessionsController < ApplicationController

  def create
    email    = parse_params[:email]
    password = parse_params[:password]
    @user = User.find_by_email(email)
    # I think these pieces are actually from the request.body ?
    if @user.authenticate(password)
      new_session
      render_login
    end
  end

  private

  def parse_params
    @json ||= JSON.parse(params[:user], symbolize_names: true)
  end

  def new_session
    session[:user_id] = @user.id
  end

  def render_login
    response.status = 200
    render json: LoginSerializer.new(@user)
  end

end
