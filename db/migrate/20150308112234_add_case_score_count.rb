class AddCaseScoreCount < ActiveRecord::Migration
  def change

  	add_column :delegates, :case1_eval_count, :integer, :default => 0
  	add_column :delegates, :case2_eval_count, :integer, :default => 0
  	add_column :delegates, :case3_eval_count, :integer, :default => 0
  	add_column :delegates, :case4_eval_count, :integer, :default => 0

  end
end