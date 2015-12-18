class Group < ActiveRecord::Base
	
	def self.group_search(gr)
		if gr
			where(group_name: gr)
		else
			all
		end

	end

end
