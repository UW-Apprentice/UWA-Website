class AddFieldsToFeedback < ActiveRecord::Migration
  def change
  	add_column :feedbacks, :overall_contribution, :integer
  	add_column :feedbacks, :business_sense, :integer
  	add_column :feedbacks, :presentation_skills, :integer
  end
end
