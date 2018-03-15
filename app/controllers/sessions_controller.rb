class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to user_path(current_user), alert: t(".flash.alert")
    end
  end

  def create
    if user&.authenticate(params[:session][:password])
      log_in(user)
    else
      flash[:alert] = t(".flash.alert")
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path, notice: t(".flash.notice")
  end

  private

  def user
    @user ||= User.find_by(email: params[:session][:email])
  end
end
