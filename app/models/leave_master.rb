class LeaveMaster < ActiveRecord::Base

	before_save :holidays_and_actual_days,if: Proc.new { |a| a.start_date!=nil and a.end_date!=nil},:on=> :create

	after_create :send_leave_request_mail,:on=> :create
	after_update :approval_mail,if: Proc.new{ |a| a.status == "approve"}
	after_update :reject_mail,if: Proc.new{ |a| a.status == "reject"}

	
	validates :start_date,presence: true,:on=> :create
	validates :end_date,presence: true,:on=> :create
	validates :leave_type,presence: true,:on=> :create
	validates :reason_for_leave,presence: true,:on=> :create

	
	validate :chk_date_present,if: Proc.new { |a| a.start_date!=nil and a.end_date!=nil},:on=> :create

	validate :leave_rules_pl,if: Proc.new { |a| a.leave_type=="PL" },:on=> :create
	
	validate :chk_apply_pl_days,if: Proc.new { |a| a.leave_type=="PL" },:on=> :create
	validate :chk_apply_cl_days,if: Proc.new { |a| a.leave_type=="CL" },:on=> :create
	validate :chk_apply_sl_days,if: Proc.new { |a| a.leave_type=="SL" },:on=> :create


	validate :chk_remaining_pl_days,if: Proc.new { |a| a.leave_type=="PL" },:on=> :create
	validate :chk_remaining_cl_days,if: Proc.new { |a| a.leave_type=="CL" },:on=> :create
	validate :chk_remaining_sl_days,if: Proc.new { |a| a.leave_type=="SL" },:on=> :create


	validate :matirnity_leave_chk,if: Proc.new { |a| a.leave_type=="ML" },:on=> :create 


	private
	
		def send_leave_request_mail
				LmsMailer.leave_request_mail(self.user_id,self.id).deliver_later
		end

			def approval_mail
				LmsMailer.leave_approval_mail(self.user_id,self.id).deliver_later
			end

			def reject_mail
				LmsMailer.leave_reject_mail(self.user_id,self.id).deliver_later
			end

			def holidays_and_actual_days
				days_between_dates = (self.end_date.to_date - self.start_date.to_date).to_i
				self.no_of_holiday = days_between_dates -self.start_date.business_days_until(self.end_date)
				self.no_of_leave_days = self.start_date.business_days_until(self.end_date)
			end


			def chk_date_present
				
				emp_rec = LeaveMaster.where(user_id: self.user_id).all
				apply_date_arr = (self.start_date..self.end_date).to_a

				st_count = 0
				ed_count = 0		

				emp_rec.each do |com_date|

					 date_arr = (com_date.start_date..com_date.end_date).to_a
						
					 if (date_arr.include?(self.start_date) == true or apply_date_arr.include?(com_date.start_date) == true)
					 	st_count = st_count+1
					 end

					 if (date_arr.include?(self.end_date) == true  or apply_date_arr.include?(com_date.end_date) == true)
					 	ed_count = ed_count+1
					 end
				end

				
				if st_count !=0 or ed_count!=0
						errors.add(:base,"You already apply leave for same  dates.") 	
				end 

			end

			def chk_apply_cl_days
				days_between_dates = (self.end_date.to_date - self.start_date.to_date).to_i
				self.no_of_holiday = days_between_dates -self.start_date.business_days_until(self.end_date)
				actual_days = self.start_date.business_days_until(self.end_date)

				if actual_days > 2
					errors.add(:base,"You can take maximum 2 days CL,but you apply for #{days_between_dates} days.")
				end
			end

			def chk_apply_pl_days
				
				days_between_dates = (self.end_date.to_date - self.start_date.to_date).to_i
				self.no_of_holiday = days_between_dates -self.start_date.business_days_until(self.end_date)
				actual_days = self.start_date.business_days_until(self.end_date)

				if actual_days < 3
					errors.add(:base,"You can take minimum 3 days PL,but you apply for #{days_between_dates} days.")
				end
			end
		    
		    def chk_apply_sl_days
				days_between_dates = (self.end_date.to_date - self.start_date.to_date).to_i
				self.no_of_holiday = days_between_dates -self.start_date.business_days_until(self.end_date)
				actual_days = self.start_date.business_days_until(self.end_date)

				if actual_days >= 3
					errors.add(:base,"You can take minimum 3 days SL,but you apply for #{days_between_dates} days.")
				end
			end

			def start_date_validation
				if start_date.blank?
					errors.add(:base, "can not be blank") 
				elsif start_date > end_date 
					errors.add(:base, "must be greater than or equal to end date")	
				end
			end


			def end_date_is_after_start_date
				if end_date.blank?
					errors.add(:base, "can not be blank") 
				elsif end_date < start_date	
					errors.add(:base, "must be greater than start date or equal to start date")
				end
			end

			def leave_rules_pl
				max_year_pl = LeaveMaster.where(user_id: user_id,leave_type: "pl").count
				if max_year_pl >= 3
					errors.add(:base,"you can not apply for PL,maximum you can apply 3 times in a year and you reach the limit.")
				end	 
			end
			
			def remaining_pl
				
			end

			
			def matirnity_leave_chk
				chk_gen = User.where(id: self.user_id).first.gender

				if chk_gen !="Female"
					errors.add(:base,"You can not apply for Matirnity leave")
				end
			end
			
			def chk_remaining_pl_days
				days_between_dates = (self.end_date.to_date - self.start_date.to_date).to_i 

				available_pl = User.where(id: user_id).first
				left_days = available_pl.pl-available_pl.presentpl

				if left_days==0.0
					errors.add(:base,"You already used all PL. ")
				elsif days_between_dates > left_days
					errors.add(:base,"You don't have enough PL to apply.")
				end	
			end

			def chk_remaining_cl_days
				
				days_between_dates = (self.end_date.to_date - self.start_date.to_date).to_i 

				available_cl = User.where(id: user_id).first
				left_days = available_cl.cl-available_cl.presentcl

				if left_days==0.0
					errors.add(:base,"You already used all CL. ")
				elsif days_between_dates > left_days
					errors.add(:base,"You don't have enough CL to apply.")
				end	
				
			end

			def chk_remaining_sl_days
				days_between_dates = (self.end_date.to_date - self.start_date.to_date).to_i 

				available_sl = User.where(id: user_id).first
				left_days = available_sl.sl-available_sl.presentsl

				if left_days==0.0
					errors.add(:base,"You already used all SL. ")
				elsif days_between_dates > left_days
					errors.add(:base,"You don't have enough SL to apply.")
				end	
			end
end
