class Api::V1::UsersController < ApplicationController
  def get_users
    user = User.all
    if user
      render json: user, status: :ok 
    end
  end

  def add_user
    user = User.new(userparams)

    if user.save
      render json: user, status: :ok
    else
      render json: { messsage: 'User not added' }, status: :unprocessable_entity
    end
  end

  private 
  def userparams
    params.permit(:username, :email, :password_digest)
  end 
end
