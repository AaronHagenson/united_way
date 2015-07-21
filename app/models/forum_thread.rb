class ForumThread < ActiveRecord::Base
  belongs_to :user
  has_many :forum_comments
  validates :title, presence: true
  validates :content, presence: true
end
