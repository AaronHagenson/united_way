class RenameForumnCommentsColumn < ActiveRecord::Migration
  def change
    rename_column :forum_comments, :comment, :body
  end
end
