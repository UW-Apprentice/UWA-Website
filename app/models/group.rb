class Group < ActiveRecord::Base


 # Many to many
  has_many :memberships
  has_many :delegates, :through => :memberships

end
