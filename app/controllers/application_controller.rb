class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

  
  helper_method :is_logged_in?
  helper_method :current_user

  def redirect_if_not_signed_in
    redirect_to login_path unless is_logged_in?
  end 


  def redirect_if_signed_in
    redirect_to user_route_index_path(current_user) if is_logged_in?
  end 

  private
    def is_logged_in?
      session[:user_id]
    end 

    def current_user
      User.find(session[:user_id])
    end 
end
