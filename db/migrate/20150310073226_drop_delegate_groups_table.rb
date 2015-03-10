class DropDelegateGroupsTable < ActiveRecord::Migration
  def up
    drop_table :delegates_groups
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
