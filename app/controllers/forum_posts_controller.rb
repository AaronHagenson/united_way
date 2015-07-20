class ForumPostsController < ApplicationController
  before_action :find_forum_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @posts = ForumPost.all.order("created_at DESC")
  end
  
  def new
    @post = current_user.forum_posts.build     #error here
  end
  
  def create
    @post = current_user.forum_posts.build(forum_post_params)
      
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end
    
  def show
    @post = ForumPost.find(params[:id])
  end
  
  
  private
  
  def forum_post_params
    params.require(:forum_post).permit(:title, :content)
  end
  
  def find_forum_post
    @post = ForumPost.find(params[:id])
  end
  
end
