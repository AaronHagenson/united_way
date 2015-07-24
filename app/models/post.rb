class Post < ActiveRecord::Base
  belongs_to :user
  mount_uploader :picture, PostPictureUploader
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true
  validate :picture_size
  
  private
  
  #Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
