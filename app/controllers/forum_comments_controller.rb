class ForumCommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :allow_update_destroy?, only: [:update, :destroy]
 
  
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
  
  def edit
    @thread = ForumThread.find(params[:forum_thread_id])
    @comment = @thread.forum_comments.find(params[:id])
  end
  
  def update
    @thread = ForumThread.find(params[:forum_thread_id])
    @comment = @thread.forum_comments.find(params[:id]) 
    
    if @comment.update(params[:forum_comment].permit(:body))
      redirect_to forum_thread_path(@thread)
    else
      render 'edit'
    end
  end
  
  def destroy
    @thread = ForumThread.find(params[:forum_thread_id])
    @comment = @thread.forum_comments.find(params[:id])
    @comment.destroy
    redirect_to forum_thread_path(@thread)
  end
  
  private
  
  def allow_update_destroy?
    @thread = ForumThread.find(params[:forum_thread_id])
    @comment = @thread.forum_comments.find(params[:id])

    redirect_to root_path unless current_user.admin? || current_user.id == @comment.user_id
  end
  
  
end
  
  
 
