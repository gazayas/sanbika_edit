class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] #このif文は要る？
    #if (user_id = cookies.signed[:user_id])
     # user = User.find_by(id: user_id)
      #if user && user.authenticated?(:remember, cookies[:remember_token])
       # log_in user
        #@current_user = user
      #end
    #end
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end

end
