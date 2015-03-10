class AddProtectionToFeedback < ActiveRecord::Migration
  def change
  	add_column :feedbacks, :exec_secret, :integer
  	add_column :feedbacks, :type, :string
  end
end
