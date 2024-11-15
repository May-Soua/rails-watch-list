class ChangeCemmentToComment < ActiveRecord::Migration[7.1]
  def change
    rename_column(:bookmarks, :cemment, :comment)
  end
end
