class AndroidV1::UsersController < ApplicationController
  skip_before_action :authenticate, except:  [:update]

  # POST /users
  def create
    # @user = User.new(user_params)
    # @user = User.where(email: user_params[:email]).first_or_initialize
    # @user = User.find_by_email(email: user_params[:email])

    @user = User.where(email: user_params[:email]).first_or_create(user_params)


    if @user.update(user_params)
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
