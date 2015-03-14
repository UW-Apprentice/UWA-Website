class AddMessageToNotice < ActiveRecord::Migration
  def change
    add_column :notices, :notice_message, :string
  end
end
