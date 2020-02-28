class RouteController < ApplicationController
  before_action :redirect_if_not_signed_in
  before_action :set_user

  def index
    @routes = current_user.routes
    @route = Route.new
  end

  def new
    @route = @user.routes.build
end 

def create
    @route = @user.route.build(route_params)
    if @route.save
        redirect_to user_route_path
    else 
        render :new
    end 
end 

  private
        def set_user
            @user = User.find_by_id(params[:user_id])
        end 

end
