class RenameListsnameToName < ActiveRecord::Migration[7.1]
  def change
    rename_column(:lists, :lists_name, :name)
  end
end
