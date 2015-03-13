class AddWinInfoToFeedback < ActiveRecord::Migration
  def change
  	add_column :feedbacks, :case_number, :integer
  	add_column :feedbacks, :case_position, :integer
  end
end
