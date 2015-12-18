class LeaveController < ApplicationController

	def userwise_card
		respond_to do |format|
        format.html
        format.pdf do
          pdf = CardPdf.new(params[:emp_id])
          send_data pdf.render ,filename:"#{current_user.name}_leave_card_Year_2015.pdf",type: "applcation/pdf"
        end
      end   
	end

	def appleave
		@page_title ="Leave Application Form"
	 	@leave = LeaveMaster.new
	end

	def create_leave
		@page_title ="Leave Application Form"
		@leave = LeaveMaster.new(leave_params)
		respond_to do |format|
			if @leave.save
				flash[:success] = "Leave request sucessfuly register."
				format.html {redirect_to apply_leave_path}
			else
				format.html { render :appleave }
	        	format.json { render json: @leave.errors, status: :unprocessable_entity }
	      	end	
	     end 	
	end

	def summary
		@page_title ="Dashboard"
		@pending = LeaveMaster.where("status=?","pending")             	
	    @approved = LeaveMaster.where("status=?","Approved")
	end

	def pending_request
		if current_user.Manager?
			@report = User.where("report_to1=? ",current_user.id).to_a.map(&:id)
		else
			@report = User.where("report_to2=? ",current_user.id).to_a.map(&:id)
		end	
	end

	def approve_leave
		@page_title ="Approve Leaves"
		d = User.new
		LeaveMaster.update(params[:rid],:status => 'approve',:remark_date=>Time.now.strftime("%Y-%m-%d"))
		d.minus_leave(params[:ltype],params[:actual_days],params[:uid],params[:rid])
		flash[:success] = "Leave request sucessfuly register."
		redirect_to myrequest_path
	end

	def reject_leave
		respond_to do |format|
			session[:request_id] = params[:id]
			format.js { }	
		end
	end	

	def approvals
		@page_title ="Approve Leaves"
		@all_approvals = LeaveMaster.where("user_id=?",current_user.id).all
	end

	def monthview
		if current_user.HRAdmin? != true
			@leave_data = LeaveMaster.where(user_id: current_user.id).all
		 	@leave_by_date = @leave_data.group_by(&:start_date)
		 	@date = params[:month] ? Date.parse(params[:month]) : Date.today
		else
			@leave_data = LeaveMaster.all
		 	@leave_by_date = @leave_data.group_by(&:start_date)
		 	@date = params[:month] ? Date.parse(params[:month]) : Date.today

		end 
	end

	def myrequest
		
	end
	
	def save_reject_reason
		@leave = LeaveMaster.find(session[:request_id])
		LeaveMaster.update(@leave.id,:status => 'reject',rejection_reason: reject_cause_params.fetch(:rejection_reason),:remark_date=>Time.now.strftime("%Y-%m-%d"))
		render :js => "window.location = '#{myrequest_path}'"
	end

	
private
 def leave_params
	params.require(:leave_master).permit(:start_date,:end_date,:reason_for_leave,:leave_type,:user_id,:status,:apply_date,:half_day,:half_day_on_sd,:half_day_on_ed) 		
 end

def reject_cause_params
	params.require(:leave_master).permit(:rejection_reason,:remark_date)
end


end
