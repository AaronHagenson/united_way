class RemoveNameFromBlogComments < ActiveRecord::Migration
  def change
    remove_column :blog_comments, :name
  end
end
