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
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1"
    if @route.save
        puts "hi :)"
        redirect_to log_routes_path
        puts ":("
    else 
        render :new
    end 
end 

def edit
    redirect_to log_routes_path(current_user) unless current_user == @user
end 

def update
    if @route.update(route_params)
        redirect_to log_route_path(@route)
    else
        render :edit
    end 
end 

def destroy
    @route.destroy
    redirect_to log_routes_path
end 


  private
      
      def route_params
        params.require(:route).permit(:name, :location, :grade)
      end 

end
