module ApplicationHelper
  
  def user_is_admin?
    if current_user == nil || current_user.admin == false
      return false
    else
      return true
    end
  end
end
