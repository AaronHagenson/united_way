class BlogCommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @blog_comment = @post.blog_comments.create(params[:blog_comment].permit(:name, :body))
    redirect_to post_path(@post)
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @blog_comment = @post.blog_comments.find(params[:id])
    @blog_comment.destroy
    
    redirect_to post_path(@post)
  end
end
