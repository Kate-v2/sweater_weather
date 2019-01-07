
class Api::V1::UsersController < ApplicationController

  # def show
  #   user = User.find(params[:id])
  #   success(user) if user
  # end

  def create
    @user = User.make_user(new_user)
    # binding.pry
    success if @user
    # show_me(@user)
  end

  # render status:201, json: NewUserSerializer.new(@user)
  # respond_to { |format| format.json{ render :show, status: 200 }} if @user
  # format.status = 200
  # format.json{render :json => @trip, :status => :created, :location => @trip }
  # respond_to {|format| format.json { render json: NewUserSerializer.new(@user), status: 201} }



  private

  # def show_me(@user)
  #   redirect_to api_v1_user_path(@user) if @user
  # end

  def success
    # render json: new_user_json, status: 201
    render json: NewUserSerializer.new(@user), status: 201
    # render json: new_user_json
    # Rack::Utils.status_code(201)
    # response.status = 201
    # render json: new_user_json
    # head 201
    # render json: new_user_json, head 201

   #  respond_to { |format|
   #    format.json { render json: NewUserSerializer.new(@user), status: 201 }
   # }
  end


  def new_user_json
    NewUserSerializer.new(@user)
  end

  def new_user
    # input = JSON.parse(params[:user], symbolize_names: true)
    # input = JSON.parse(params, symbolize_names: true)
    input = params.dup
    input.slice!(:email, :password, :password_confirmation)
    return input
  end

end
