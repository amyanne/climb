class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

  
  helper_method :is_logged_in?
  helper_method :current_user

  def redirect_if_not_signed_in
    redirect_to login_path unless is_logged_in?
  end 


  def redirect_if_signed_in
    redirect_to user_logs_path(current_user) if is_logged_in?
  end 

  private
    def is_logged_in?
      session[:user_id]
    end 

    def current_user
      if session[:user_id]
        User.find(session[:user_id])
      end
    end 

    def set_route
      @route = Route.find_by_id(params[:route_id])
    end 

    def set_user
      @user = User.find_by_id(params[:user_id])
    end 

    def set_log
      @log = Log.find_by_id(params[:log_id])
    end
  
    protected
    def after_sign_in_path_for(resource)
      user_logs_path(@user.id)
    end
end
