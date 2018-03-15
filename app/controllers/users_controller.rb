class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    respond_with @user
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    current_user.update_attributes(user_params)

    respond_with current_user, location: -> { user_path }
  end

  private

  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :password,
      :first_name,
      :last_name,
    )
  end
end
