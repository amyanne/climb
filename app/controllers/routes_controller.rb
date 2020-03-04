class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  def index
    @routes = Route.search(params[:query], @user)
  end






  private
      
      def route_params
        params.require(:route).permit(:name, :location, :grade)
      end 

end
