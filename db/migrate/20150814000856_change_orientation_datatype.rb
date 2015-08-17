class ChangeOrientationDatatype < ActiveRecord::Migration
  def change
     change_column :posts, :image_orientation, :string
  end
end
