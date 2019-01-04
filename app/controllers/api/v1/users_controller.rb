
class Api::V1::UsersController < ApplicationController

  # def index
  # end

  # def show
  #   user = User.find(params[:id])
  #   success(user) if user
  # end

  def create
    user = User.make_user(new_user)
    success(user) if user
    # show_me(user)
  end

  # render status:201, json: NewUserSerializer.new(user)
  # respond_to { |format| format.json{ render :show, status: 200 }} if user
  # format.status = 200
  # format.json{render :json => @trip, :status => :created, :location => @trip }



  private

  def show_me(user)
    redirect_to api_v1_user_path(user) if user
  end

  def success(user)
    # respond_to {|format| format.json { render json: NewUserSerializer.new(user), status: 201} }
    # response.status = 201
    render json: new_user_json(user), status: 201
    # render json: user_json(user)
  end

  # Changing the file name did not help
  # REMOVE this & related
  def user_json(user)
    UserSerializer.new(user)
  end

  def new_user_json(user)
    NewUserSerializer.new(user)
  end

  def new_user
    input = JSON.parse(params[:user], symbolize_names: true)
    input.slice!(:email, :password, :password_confirmation)
    return input
  end

end
