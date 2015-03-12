class AddAttachmentCaseSubmissionToGroups < ActiveRecord::Migration
  def self.up
    change_table :groups do |t|
      t.attachment :case_submission
    end
  end

  def self.down
    remove_attachment :groups, :case_submission
  end
end
