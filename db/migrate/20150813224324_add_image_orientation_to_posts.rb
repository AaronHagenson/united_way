class AddImageOrientationToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :image_orientation, :integer
  end
end
