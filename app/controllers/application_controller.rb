class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # helper_method :current_user
  before_action :current_user

  def current_user
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @user = (User.find_by(id: session[:user_id]) || User.new)
  end

  def logged_in?
    # !!current_user
    current_user.id != nil
  end 

  def require_logged_in
    # if !logged_in?
    #   redirect_to login_path
    return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
  end 

end
