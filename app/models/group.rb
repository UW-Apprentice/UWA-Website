class Group < ActiveRecord::Base


 # Many to many
  has_many :memberships
  has_many :delegates, :through => :memberships

 accepts_nested_attributes_for :delegates

 has_attached_file :submitted_case
validates_attachment :submitted_case, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}

end
