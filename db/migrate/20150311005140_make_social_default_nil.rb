class MakeSocialDefaultNil < ActiveRecord::Migration
  def change
  	change_column :delegates, :facebook, :string, :default => ''
  	change_column :delegates, :linkedin, :string, :default => ''
  	change_column :delegates, :twitter, :string, :default => ''
  end
end
