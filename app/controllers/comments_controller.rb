class CommentsController < ApplicationController
  before_action :set_log


  def create
    puts "hello comments #{@log.inspect}"
    @comment = @log.comments.create(params[:comment].permit(:content))
      puts "HELP COMMMENTTTSSSS #{@log.inspect}"
    redirect_to log_comments_path 
  end

  def destroy
    @comment = @log.comments.find(params[:id])
    @comment.destroy
    redirect_to user_logs_path
end
end
