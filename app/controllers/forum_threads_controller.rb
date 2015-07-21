class ForumThreadsController < ApplicationController
  before_action :find_forum_thread, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
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
  
end
