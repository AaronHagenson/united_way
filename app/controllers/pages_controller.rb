class PagesController < ApplicationController
  
  def about
  end
  
  def admin
    @posts = Post.all.order('created_at DESC')
  end
  
  def contact
  end
end
