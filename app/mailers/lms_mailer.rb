class LmsMailer < ApplicationMailer
	def leave_request_mail(user,row_id)
		@lms_url="http://132.147.161.174:3000"
		@leave_details = LeaveMaster.where(id: row_id).first
	 	@requester_data = User.where(id: user).first
	 	@boss_data = User.where(id: @requester_data.report_to1).first
	 	mail(to: @requester_data.email, subject: 'Leave Request',:template_name=>"requester_copy").deliver!
	 	mail(to: @boss_data.email, subject: 'Leave Request',:template_name=>"boss_copy").deliver!
	end

	def leave_approval_mail(user,row_id)
		@lms_url="http://132.147.161.174:3000"
		@leave_details = LeaveMaster.where(id: row_id).first
	 	@requester_data = User.where(id: user).first
	 	mail(to: @requester_data.email, subject: 'Leave Approved',:template_name=>"approved_copy").deliver!
	end
	
	def leave_reject_mail(user,row_id)
		@lms_url="http://132.147.161.174:3000"
		@leave_details = LeaveMaster.where(id: row_id).first
	 	@requester_data = User.where(id: user).first
	 	mail(to: @requester_data.email, subject: 'Leave Rejected',:template_name=>"rejected_copy").deliver!
	end

end
