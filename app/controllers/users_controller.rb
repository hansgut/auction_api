class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/:id
  def show
    render json: @user, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end

  end

  # PUT /users/:id
  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /users
  def destroy
    if @user.destroy
      render json: { message: "user #{@user.username} was deleted!" }, status: :ok
    else
      render json: { message: "user #{@user.username} was not deleted!" }, status: :bad_request
    end
  end

  # GET /current_user
  def get_current_user
    render json: @current_user
  end

  private

  def user_params
    params.permit(:name, :username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
