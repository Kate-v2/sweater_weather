

class Api::V1::SessionsController < ApplicationController

  def create
    login = JSON.parse(params[:user], symbolize_names: true)
    @user = User.find_by_email(login[:email])
    # I think these pieces are actually from the request.body ?
    if @user.authenticate(login[:password])
      session[:user_id] = @user.id
      response.status = 200
      render json: LoginSerializer.new(@user)
    end
  end


end
