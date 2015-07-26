class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :is_admin?, only: [:update, :destroy]

  def index
     @posts = Post.all.order('created_at DESC')
     @post1 = @posts[0]
     @post2 = @posts[1]
     @post3 = @posts[2]
     @post4 = @posts[3]
     @post5 = @posts[4]
     @post6 = @posts[5]
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to @post
    else 
      render 'new'
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    
    if @post.update(params[:post].permit(:title, :body, :summary, :picture))
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    redirect_to root_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :body, :summary, :picture)
  end
  
  def is_admin?
    @post = Post.find(params[:id])
    redirect_to root_path unless current_user.admin?
  end

  
end
