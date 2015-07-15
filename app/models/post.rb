class Post < ActiveRecord::Base
  has_many :blog_comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true
end
