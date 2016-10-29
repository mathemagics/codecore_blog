class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authorize_access
    redirect_to root_path, notice: "Ne pas toucher" unless user_signed_in?
  end

  def authenticate_user
    redirect_to new_session_path, notice: 'Sign in to do that!' unless user_signed_in?
  end

  def user_signed_in?
    session[:user_id].present?
  end
  helper_method :user_signed_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if user_signed_in?
  end
  helper_method :current_user

end
