# encoding: utf-8

class PostPictureUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
   include CarrierWave::MiniMagick
   
  # How to make this work for vertical images???
   #process resize_to_fill: [640, 480]
   #process resize_to_fill: [480, 640]
  # process :test
   
    # def test
    # if model.image_orientation == "horizontal"
    #   resize_to_fill(640,480)
    # elsif model.image_orientation == "vertical"
    #   resize_to_fill(480,640)
    # end
    # end
    
    # def test
    #   if model.crop_x.present?
    #     puts "It's present!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    #   # if model.is_horizontal?
    #   #   resize_to_fill(640, 480)
    #   end
    # end
  
 
   
   if Rails.env.production?
     storage :fog
   else
     storage :file
   end


  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end
    version :large do
      process :crop
     # process :resize_to_fill => [640, 480] # can I change this to a square just for the final view? also remember to rollback DB and go back to checkbox.
    end
    
  
    version :vertical do
      process :crop_vertical
     # process :resize_to_fill => [480, 640]
    end
    
    version :horiz do
      process :resize_to_fill => [640, 480]
      process :crop
    end
    
    version :vert do
      process :resize_to_fill => [480, 640]
      process :crop_vertical
    end
    
  
    
  def crop
    if model.crop_x.present?
      resize_to_limit(640, 480)
      manipulate! do |img|
        x = model.crop_x.to_i
        y = model.crop_y.to_i
        w = model.crop_w.to_i
        h = model.crop_h.to_i
        img.crop("#{w}x#{h}+#{x}+#{y}")
        img
      end
    end
  end
    
  def crop_vertical
    if model.crop_x.present?
      resize_to_limit(480, 640)
      manipulate! do |img|
        x = model.crop_x.to_i
        y = model.crop_y.to_i
        w = model.crop_w.to_i
        h = model.crop_h.to_i
        img.crop("#{w}x#{h}+#{x}+#{y}")
        img
      end
    end
  end



  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
   def extension_white_list
     %w(jpg jpeg gif png)
   end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
