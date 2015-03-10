class AddDelegateIdToMembership < ActiveRecord::Migration
  def change
    add_column :memberships, :delegate_id, :integer
  end
end
