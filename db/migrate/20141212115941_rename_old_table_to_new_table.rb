class RenameOldTableToNewTable < ActiveRecord::Migration
  def change
    rename_table :links, :standups
  end
end
