
class Api::V1::UsersController < ApplicationController

  def create
    @user = User.make_user(new_user)
    success if @user
  end

  private

  def success
    render json: NewUserSerializer.new(@user), status: 201
  end


  def new_user_json
    NewUserSerializer.new(@user)
  end

  def new_user
    input = params.dup
    input.slice!(:email, :password, :password_confirmation)
    return input
  end

end
