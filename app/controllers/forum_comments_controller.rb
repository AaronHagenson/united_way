class ForumCommentsController < ApplicationController
  
  def create
    @thread = ForumThread.find(params[:forum_thread_id])
    @comment = @thread.forum_comments.create(params[:forum_comment].permit(:body))
    @comment.user_id = current_user.id if current_user
    
    if @comment.save
      redirect_to forum_thread_path(@thread)
    else
      render 'new'
    end
  end
  
  
  
  
  
  
  
  
  
  
end
  
 
