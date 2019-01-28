

class Api::V1::SessionsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    input = parse_params
    email    = input[:email]
    password = input[:password]
    @user = User.find_by_email(email)
    if @user.authenticate(password)
      new_session
      render_login
    end
  end

  private

  def parse_params
    input = params.dup
    input.slice!(:email, :password)
    return input
  end

  def new_session
    session[:user_id] = @user.id
  end

  def render_login
    response.status = 200
    render json: LoginSerializer.new(@user)
  end

end
