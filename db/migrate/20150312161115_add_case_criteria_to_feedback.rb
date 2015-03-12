class AddCaseCriteriaToFeedback < ActiveRecord::Migration
  def change
  	add_column :feedbacks, :case_impact, :integer
  	add_column :feedbacks, :case_feasibility, :integer
  	add_column :feedbacks, :case_innovation, :integer
  	add_column :feedbacks, :case_presentation, :integer
  	add_column :feedbacks, :case_overall, :integer
  end
end
