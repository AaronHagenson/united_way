class RenameAnotherForumCommentsColumn < ActiveRecord::Migration
  def change
     rename_column :forum_comments, :forum_post_id, :forum_thread_id
  end
end
