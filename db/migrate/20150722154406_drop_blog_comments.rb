class DropBlogComments < ActiveRecord::Migration
  def change
    drop_table :blog_comments
  end
end
