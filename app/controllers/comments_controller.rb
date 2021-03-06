class CommentsController < ApplicationController
  before_action :set_log
  before_action :set_user


  def create
    @comment = @log.comments.create(comment_params)
    redirect_to log_comments_path 
  end

  def destroy
    @comment = @log.comments.find(params[:id])
    @comment.destroy
    redirect_to user_logs_path
  end

private 

def comment_params 
  params.require(:comment).permit(:content)
end 


end
