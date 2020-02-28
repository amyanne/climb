class RoutesController < ApplicationController
  before_action :redirect_if_not_signed_in
  before_action :set_user
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  def index
    @routes = Route.search(params[:query], @user)
  end

  def new
    @route = Route.new
end 

def create
    @route = @user.routes.build(route_params)
    if @route.save
        redirect_to user_routes_path
    else 
        render :new
    end 
end 

def edit
    redirect_to user_routes_path(current_user) unless current_user == @user
end 

def update
    if @route.update(route_params)
        redirect_to user_route_path(@route)
    else
        render :edit
    end 
end 

def destroy
    @route.destroy
    redirect_to user_routes_path
end 


  private
      def set_user
            @user = User.find_by_id(params[:user_id])
      end 
      
      def set_route
          @route = Route.find_by_id(params[:id])
      end 
      
      def route_params
        params.require(:route).permit(:name, :location, :grade)
      end 

end
