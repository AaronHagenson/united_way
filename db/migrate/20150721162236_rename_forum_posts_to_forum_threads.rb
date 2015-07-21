class RenameForumPostsToForumThreads < ActiveRecord::Migration
  def change
    rename_table :forum_posts, :forum_threads
  end
end
