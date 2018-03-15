class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in(@user, t("flash.users.create.notice"))
    else
      flash[:alert] = t("flash.users.create.alert")
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    current_user.update_attributes(user_params)

    respond_with current_user
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
