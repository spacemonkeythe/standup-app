class RenameColumnlinkIdInTabletasksTostandupId < ActiveRecord::Migration
  def change
    rename_column :tasks, :link_id, :standup_id
  end
end
