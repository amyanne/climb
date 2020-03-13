class RoutesController < ApplicationController
  before_action :set_log
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  def index
    @routes = Route.search(params[:query])
    puts "####$$$$$$$$$$^^^^^^^^^^#{route_params}"
  end

  def create 
    @route = @log.route.build(route_params)
  end

  def show
    
    @route = Route.find_by_id(params["id"])
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!%%%%%%%%%%%%%%%%%%%%%#{@route.logs.inspect}"
  end 
   
 




  private
      
      def route_params
        params.require(:route).permit(:name, :location, :grade)
      end 

end
