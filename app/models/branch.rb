class Branch < ActiveRecord::Base
	def self.search_branch(br)
		if br
			where(branch_name: br)
		else
			all
		end

	end

end
