class LogsController < ApplicationController
  before_action :set_user
  before_action :set_log, only: [:show, :edit, :update, :destroy]
   
  def index
    @logs = Log.search(params[:query], @user)
   end

  def new
    @log = Log.new
    @route = Route.new

  end 


  def create
    @log = @user.logs.create(log_params)
    # @log.route_id = Route.find_or_create()
    puts "lol lol lol #{@log.inspect}"
    
    if @log.save
      puts "????????? #{@log.inspect}"
        redirect_to user_logs_path
        puts "!!!!!@@@@@@@@@@@@@@!!!!!!!!!!! #{@log}"
    else 
        render :new
    end
  end 

  def destroy 
    @log.destroy
    redirect_to user_logs_path
  end 

  def update 
  end 

private 

  def log_params
    params.require(:log).permit(:log_date, :content, :num_of_attempts, :user_id, :route_id, route_attributes: [:name, :location, :grade])
  end 

  def set_log
    @log = Log.find_by_id(params[:id])
  end

  



  
end
