class Api::V1::AuthController < ApplicationController

  def create

    @user = User.find_by(user_name: params[:user_name])
    if @user && @user.authenticate(params[:password])
      puts "found #{@user.first_name}"
      render json: {user: UserSerializer.new(@user), token: issue_token({id: @user.id})}, status: 200
    else
      render json: {error: "User is invalid"}, status: 401
    end
  end

  def show

    user = User.find_by(id: user_id)
    if user
      render json: {user: UserSerializer.new(user)}, status: 200
    else
      render json: {error: "User is invalid"}, status: 401
    end

  end




end
