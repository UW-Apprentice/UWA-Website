class Membership < ActiveRecord::Base

	# Many to many
	belongs_to :delegate
	belongs_to :group

	def self.get_groups(d_id)

		groups_array = []
		@delegate_memberships = Membership.where(:delegate_id => d_id)
		@delegate_memberships.each do |m|
			@delegate_groups = Group.where(:id => m.group_id).first
			groups_array << @delegate_groups
		end

		return groups_array
	end
end
