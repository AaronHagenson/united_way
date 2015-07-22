class ForumThread < ActiveRecord::Base
  belongs_to :user
  has_many :forum_comments, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true
end
