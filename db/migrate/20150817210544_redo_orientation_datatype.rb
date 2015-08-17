class RedoOrientationDatatype < ActiveRecord::Migration
  def change
    change_column :posts, :image_orientation, :integer
  end
end
