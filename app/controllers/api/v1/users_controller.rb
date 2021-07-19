class Api::V1::UsersController < ApplicationController
  before_action :getUser, only: [:update_user, :delete_user, :show_user_by_id]

  def show_user_by_id
    if @user
      render json: @user, status: :ok
    else
      render json: { json: 'User not found' }, status: :not_found
    end
  end

  def show_users
    user = User.all
    if user
      render json: user, status: :ok
    else
      render json: { msg: 'Theres no users' }, status: :unprocessable_entity
    end
  end

  def add_user
    user = User.new(userparams)

    if user.save
      render json: user, status: :ok
    else
      render json: { msg: 'User not added' }, status: :unprocessable_entity
    end
  end

  def update_user
    if @user
      if @user.update(userparams)
        render json: @user, status: :ok
      else
        render json: { msg: 'Update failed' }, status: :unprocessable_entity
      end
    else
      render json: { json: 'User not found' }, status: :not_found
    end
  end

  def delete_user
    if @user
      if @user.destroy
        render json: { msg: 'User deleted' }, status: :ok
      else
        render json: { msg: 'Update failed' }, status: :unprocessable_entity
      end
    else
      render json: { json: 'User not found' }, status: :not_found
    end
  end

  private

  def userparams
    params.permit(:username, :email, :password_digest)
  end

  def getUser
    @user = User.find(params[:id])
  end
end
