class ForumThreadsController < ApplicationController
  before_action :find_forum_thread, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :allow_update_destroy?, only: [:update, :destroy]

  
  def index
    @threads = ForumThread.all.order("created_at DESC")
  end
  
  def new
    @thread = current_user.forum_threads.build     
  end
  
  def create
    @thread = current_user.forum_threads.build(forum_thread_params)
      
    if @thread.save
      redirect_to @thread
    else
      render 'new'
    end
  end
    
  def show
    @thread = ForumThread.find(params[:id]) 
  end
  
  def edit
    @thread = ForumThread.find(params[:id])
  end
  
  def update 
    if @thread.update(forum_thread_params)
      redirect_to @thread
    else
      render 'edit'
    end
  end
  
  def destroy
    @thread.destroy
    redirect_to root_path
  end

  
  
  private
  
  def forum_thread_params
    params.require(:forum_thread).permit(:title, :content)
  end
  
  def find_forum_thread
    @thread = ForumThread.find(params[:id])
  end
  
  def allow_update_destroy?
    find_forum_thread
    redirect_to root_path unless current_user.admin? || current_user.id == @thread.user_id
  end

  
end
