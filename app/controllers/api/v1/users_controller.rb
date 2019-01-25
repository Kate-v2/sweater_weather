
class Api::V1::UsersController < ApplicationController

  # skip_before_filter :verify_authenticity_token
  skip_before_action :verify_authenticity_token  

  def create
    binding.pry

    @user = User.make_user(new_user)
    success if @user
  end

  private

  def success
    render json: NewUserSerializer.new(@user), status: 201
  end

  def new_user
    input = params.dup
    input.slice!(:email, :password, :password_confirmation)
    return input
  end

end
