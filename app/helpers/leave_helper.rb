module LeaveHelper

	def user_name(user_ids)
		User.where(:id=>user_ids).first
	end

	def sl_chk(leave_count,user_id)
		if leave_count == 0
			User.where(:id=>user_id).first.sl	
		else
			User.where(:id=>user_id).first.presentsl	
		end
	end

	def cl_chk(leave_count,user_id)
		if leave_count == 0
			User.where(:id=>user_id).first.cl	
		else
			User.where(:id=>user_id).first.presentcl	
		end
	end

	def pl_chk(leave_count,user_id)
		if leave_count == 0
			User.where(:id=>user_id).first.pl	
		else
			User.where(:id=>user_id).first.presentpl	
		end
	end

	def cal_pl(user_id)
		pldata = User.where(:id=>user_id).first

		if pldata.presentpl==0
			return 0
		else
			return pldata.presentpl
		end


	end

	def cal_cl(user_id)

		cldata = User.where(:id=>user_id).first
		if cldata.presentcl==0
			return 0
		else
			return cldata.presentcl
		end

	end

	def cal_sl(user_id)
		sldata = User.where(:id=>user_id).first
		if sldata.presentsl==0
			return 0
		else
			return sldata.presentsl
		end

	end

	def onpage_pl_leave(user_id)
		user_data = User.where(:id=>user_id).first
		if user_data.pl == user_data.presentpl
			return 0
		elsif user_data.presentpl==0.0
			return user_data.pl
		elsif user_data.presentpl!=0.0
			return (user_data.pl - user_data.presentpl)
		end
	end

		def onpage_sl_leave(user_id)
		user_data = User.where(:id=>user_id).first
		if user_data.sl == user_data.presentsl
			return 0
		elsif user_data.presentsl==0.0
			return user_data.sl
		elsif user_data.presentsl!=0.0
			return (user_data.sl - user_data.presentsl)
		end
	end

	def onpage_cl_leave(user_id)
		user_data = User.where(:id=>user_id).first
		if user_data.cl == user_data.presentpl
			return 0
		elsif user_data.presentcl==0.0
			return user_data.cl
		elsif user_data.presentcl!=0.0
			return (user_data.cl - user_data.presentcl)
		end
	end

	def requestpg_half_day(nod)
		if nod == 0.0
			return "0.5"
		else
			return nod
		end

	end

end
