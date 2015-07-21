class ForumComment < ActiveRecord::Base
  belongs_to :forum_thread
  belongs_to :user
end
