class PagesController < ApplicationController
  before_action :admin_user?, only: [:admin]
  
  def about
  end
  
  def admin
    @posts = Post.all.order('created_at DESC')
  end
  
  def contact
  end
  
end


private

  def admin_user?
    redirect_to root_url unless current_user.admin 
  end