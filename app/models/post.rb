class Post < ActiveRecord::Base
  belongs_to :user
  mount_uploader :picture, PostPictureUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_picture
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true
  validate :picture_size
  
  # def is_horizontal?
  #   if orient == "h"
  #     puts "HHHHHHHHHH"
  #   end
  # end
  
  private
  
  #Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
  
   def crop_picture
    picture.recreate_versions! if crop_x.present?
   end
  


end
