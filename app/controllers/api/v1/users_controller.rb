
class Api::V1::UsersController < ApplicationController

  # def index
  # end

  def create
    user = User.new(new_user)
    user.generate_api_key
    return unless user.confirm
    if user.save!
      respond_to do |format|
        format.json{render json: {api_key: user.token}, status: 201 }
        binding.pry
      end
    end
  end


  private

  def new_user
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
