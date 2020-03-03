class LogsController < ApplicationController
  before_action :set_user
  before_action :set_log, only: [:show, :edit, :update, :destroy]
  

  def new
    @log = Log.new
  end 

  def create 
    @log = @user.logs.build(log_params)
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

  def update 
  end 

private 

  def log_params
    params.require(:log).permit(:log_date, :content)
  end 


  def set_log
    @log = Log.find_by_id(params[:id])
  end


  
end
