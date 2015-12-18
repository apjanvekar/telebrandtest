class Department < ActiveRecord::Base

	def self.search_dept(dept)
		if dept
			where(department_name: dept)
		else
			all
		end
	end

end
