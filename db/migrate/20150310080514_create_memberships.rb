class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :group_id
      t.integer :delegate_id_for_group
      t.datetime :created_at

      t.timestamps
    end
  end
end
