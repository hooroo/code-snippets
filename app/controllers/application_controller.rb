require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception

  private

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end
  helper_method :current_user

  def log_in(user, msg=t("sessions.create.flash.notice"))
    session[:user_id] = user.id
    redirect_to user_path, notice: msg
  end
end
