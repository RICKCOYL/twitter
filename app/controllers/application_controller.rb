class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user
  end

  def require_login
    return if logged_in?

    flash[:danger] = 'Please login!'
    redirect_to login_path
  end

  def user_params
    params.require(:user).permit(:username, :photo, :cover_image)
  end
end
