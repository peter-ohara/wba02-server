class AndroidV1::UsersController < ApplicationController
  skip_before_action :authenticate, only: [:create]


  # GET /users/1
  def show
    @user = User.find_by(auth_token: params[:id])

    render json: @user
  end

  # POST /users
  def create
    @user = User.where(email: user_params[:email]).first_or_create(user_params)

    @user.display_name = user_params[:display_name]
    @user.email = user_params[:email]
    @user.profile_url = user_params[:profile_url]
    @user.regenerate_auth_token

    @current_user = @user

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:display_name, :email, :profile_url)
  end
end
