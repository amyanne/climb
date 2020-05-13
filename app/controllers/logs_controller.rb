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
    if @log.save
        redirect_to user_logs_path
    else 
        render :new
    end
  end 

  def destroy 
    @log.destroy
    redirect_to user_logs_path
  end 

  def edit
    redirect_to user_logs_path unless current_user == @user
  end 

def update
    if @log.update(log_params)
        redirect_to user_logs_path
    else
        render :edit
    end 
end 

private 

  def log_params
    params.require(:log).permit(:log_date, :content, :num_of_attempts, :user_id, :route_id, route_attributes: [:name, :location, :grade])
  end 

  def set_log
    @log = Log.find_by_id(params[:id])
  end

  



  
end
