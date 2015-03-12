class AddCaseWinnersToMembership < ActiveRecord::Migration
  def change
  	add_column :memberships, :case_one_winner, :boolean, :default => false
  	add_column :memberships, :case_two_winner, :boolean, :default => false
  	add_column :memberships, :case_three_winner, :boolean, :default => false
  	add_column :memberships, :case_four_winner, :boolean, :default => false

  	add_column :memberships, :case_one_second, :boolean, :default => false
  	add_column :memberships, :case_two_second, :boolean, :default => false
  	add_column :memberships, :case_three_second, :boolean, :default => false
  	add_column :memberships, :case_four_second, :boolean, :default => false

  	add_column :memberships, :case_one_third, :boolean, :default => false
  	add_column :memberships, :case_two_third, :boolean, :default => false
  	add_column :memberships, :case_three_third, :boolean, :default => false
  	add_column :memberships, :case_four_third, :boolean, :default => false
  

  end
end
